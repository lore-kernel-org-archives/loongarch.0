Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DBA218EBA;
	Thu,  8 Oct 2026 02:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791427718; cv=none; b=a/WtUZ40R1xn89A6RuWWTmhUM+o9FJXr5vUUcXlqcjwJz7/iceiZLqkp9sSd3qVnY8yXmFSVQKGkrriJQDXGsvZo15dW6KQxAqcctaCx5LSdyddGczwRAYZk55kRMC8jSlDaBHXrtnYz9f+QtWUe/E2XSyF3X75dBDUIWbC+Vro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791427718; c=relaxed/simple;
	bh=cH56IWVlPRuKjxV86otArl7iW+zMZcLhNGSpmi/ZzZc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EoiqmrImhcCCiN9yXfBg4byYN5rv8W0sWWQrsdRh5LSzXq0wU56kX3ZhSK0+jJX5SPzPQlJZQt6H+7kyY49qbwUa1dzgUryXQICc9kJhM8trXe85NGB6/JfWpatM9J7XSnJdc0dTWOce0XkrxTomwErGO4tT0R6W8HjRbiRd+08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkc3D34l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkc3D34l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE191F000FF;
	Thu,  8 Oct 2026 02:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791427717;
	bh=cH56IWVlPRuKjxV86otArl7iW+zMZcLhNGSpmi/ZzZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hkc3D34l/3054Pkzsb6b9gtNDl9yb8FuToP5FVIi3NhrjSQSrWKuNL+MUlBrK02VE
	 2+uft9ogjJD0hnCkd215d/8ms1B6UEUdCzTM5rinpGKUU7sb89MM57Pkr5bIbiC+Ti
	 nm3MrU4bV3GVLtfFSuuWPstHm6xK99EnkEZQiMTUjfM1GgMVqCWfbk+bQNUBxxPC75
	 rb5louN3f2a8bOrtkLizki+2p2Z78LXJBnjVgXtqLE0CJsputOty8FJ3V5wn6IN916
	 pOL36Cevynub8UolubvRI6Ew9MNrHeUG3zcbql/QlLmxSgA+ZqpNTK/Sc7MWh3qP4I
	 X2FqGrfIxDTSw==
Message-ID: <sashiko-outbox-163521@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] LoongArch: kdump: add arch_crash_save_vmcoreinfo()
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mike Rapoport" <rppt@kernel.org>, "Baoquan He" <baoquan.he@linux.dev>, "Yangyang
 Lian" <lianyangyang@kylinos.cn>, "Andrew Morton" <akpm@linux-foundation.org>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Huacai
 Chen" <chenhuacai@kernel.org>
Cc: "WANG Xuerui" <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, "Haoran
 Jiang" <jianghaoran@kylinos.cn>, "Tao Cui" <cuitao@kylinos.cn>, "George Guo" <guodongtai@kylinos.cn>, kexec@lists.infradead.org, "Dave
 Young" <ruirui.yang@linux.dev>
In-Reply-To: <20261008023419.118623-1-lianyangyang@kylinos.cn>
References: <20260924075655.375632-1-lianyangyang@kylinos.cn>
 <20261008023419.118623-1-lianyangyang@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 02:48:36 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008023419.1186=
23-1-lianyangyang@kylinos.cn?part=3D1

