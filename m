Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5132B4137B2;
	Thu, 24 Sep 2026 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237096; cv=none; b=Fqm4MjFnkcNu2uC8x+VSc8oh1Arc6e/hHHH6H5zfufmr2vNj9Wlho4G2pyBi0F+0fNJlcf69YBeSWc7aGVZd84Y6maHKL01iJtx3bJ/yDXd4AtRubxDbIuiQWnyomE/LHYz20rZbRCr1ltX3yT5eh52CNU7kH/8fKTXMVFIuzhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237096; c=relaxed/simple;
	bh=sKd3Ee2wwpszSTcHMWC9Vp5q123rbV4yhxViyI+qQyk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dr4aQaV2XAU37xaXBDys2Jr7FLexdHduq9T2gzA80isiskNDW6zKSN5NViVWjGCTPPgNzXhywxGEzwJerW4pjIRYpQ4XwjuQnDJk0cVhlUyexd4H7DxxU25Tlmbrn9eT+c0BeJ9eD/JYuqJlnca0a0VbT2WXNtaZbddyVAz+wfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1AQMwAk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1AQMwAk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B681F00893;
	Thu, 24 Sep 2026 08:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790237094;
	bh=sKd3Ee2wwpszSTcHMWC9Vp5q123rbV4yhxViyI+qQyk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m1AQMwAkmdnV44EXHhXPmEuHRUG2YQ6pBh0NPzzqWXCa+/cFyzyawg/XKevzlbv1m
	 +3Rp0+F6O6ijeb6n8JtM0GqA6NE9UmJdX4WBVfNFtHKCu8/WWYe9zkrri5aGpWdB91
	 Gv1Jckf163saFWmT/H7ENujwc2roDsrq+Of1GozJSOsMuaW5hN5vS5i1P+S7XLUSko
	 UKEHn43l343/dRKS1QfDrmiMFbBF3ajHWPrKPNHxVjEI7TkHccma8yk3dvE/op5miq
	 3O0bc8I5xN+W+YP7JTlmf6Y/8sYfdqc1c5XKG5RtvseW6XcjaGXwDlNffLYl8YECKX
	 Feyq0nHq1YPAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] LoongArch: kdump: add arch_crash_save_vmcoreinfo()
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yangyang Lian" <lianyangyang@kylinos.cn>, "Andrew Morton" <akpm@linux-foundation.org>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Huacai
 Chen" <chenhuacai@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Baoquan
 He" <baoquan.he@linux.dev>
Cc: "WANG Xuerui" <kernel@xen0n.name>, "Tao Cui" <cuitao@kylinos.cn>, "Dave
 Young" <ruirui.yang@linux.dev>, "George Guo" <guodongtai@kylinos.cn>, kexec@lists.infradead.org, loongarch@lists.linux.dev, "Haoran
 Jiang" <jianghaoran@kylinos.cn>, linux-kernel@vger.kernel.org
In-Reply-To: <20260924075655.375632-1-lianyangyang@kylinos.cn>
References: <20260923060349.146780-1-lianyangyang@kylinos.cn>
 <20260924075655.375632-1-lianyangyang@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 08:04:53 +0000
Message-Id: <20260924080454.30B681F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

> Since commit 23c85094fe18 ("proc/kcore: add vmcoreinfo note to
> /proc/kcore") the kernel has exported the vmcoreinfo PT_NOTE on
> /proc/kcore as wellas /proc/vmcore.
>=20
> LoongArch does not provide arch_crash_save_vmcoreinfo(), so the
> arch-specific values are missing from the vmcoreinfo PT_NOTE. The
> generic exporter in kernel/vmcore_info.c already provides
> NUMBER(VMALLOC_START), but tools like crash cannot derive the module
> and vmemmap ranges, VA_BITS, or the KASLR offset of a LoongArch dump.
>=20
> Since commit 18210a104bb9 ("LoongArch: Expand module virtual address
> space to 2GB") the vmalloc and module boundaries are no longer stable
> across kernel versions either, so vmcoreinfo is the only reliable
> source for them.
>=20
> Provide this function in a separate file that is built at the same time
> as its caller in kernel/vmcore_info.c, and add a LOONGARCH64 section to
> Documentation/admin-guide/kdump/vmcoreinfo.rst.
>=20
> Reported-by: Haoran Jiang <jianghaoran@kylinos.cn>
> Suggested-by: Haoran Jiang <jianghaoran@kylinos.cn>
> Tested-by: Tao Cui <cuitao@kylinos.cn>
> Co-developed-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: Yangyang Lian <lianyangyang@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924075655.3756=
32-1-lianyangyang@kylinos.cn?part=3D1

