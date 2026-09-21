Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D3B3559C9;
	Mon, 21 Sep 2026 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981982; cv=none; b=FT0aHi8JD7doZoYV73COfv0QozJ9uP+tTe6wie7WRteVaz6Qixd7LKFTJDp9kPpQHuRzOH1nJkSl5zayvcM+uLCMLD9xEQXYqbYDzXRCiiAjKqsZ1pPZ/kzjPxZsZ1XJ8lZzlGn1FMtyVPLLwA3y4Dh0HUinAB5pjvcOpBq1oaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981982; c=relaxed/simple;
	bh=/WfwSj0SUsP3uLadBypCB3UfgoCzQVYDLKWPCUa5wNE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OgOZ4MSbeBhD0Qs8+Eh9NT68kWDqsjjQ4aJVIE2llz1C4WBM5YLPtSQi8GuZnwQeD6EaPc9wYYf+omjkUbCRxo+or+7lmQZiziyn3d2wHnYV2rveg0Z/gSi5Q/you7nM23gs3/E8oPuwWJubGiB9mpKLGA7ntKHX1oLnix7nUOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=fail (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1I5zBeY reason="signature verification failed"; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1I5zBeY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEE01F00893;
	Mon, 21 Sep 2026 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789981981;
	bh=/WfwSj0SUsP3uLadBypCB3UfgoCzQVYDLKWPCUa5wNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B1I5zBeYLORpIuyWyUAUWC0Uh4n7bfpfDQAmO+S9O5D57CCdmuhZF6EHDQKvq/cvP
	 10Ma/TXixn8nltQYxWYicB+x3A+NX/4RaAo1K7Tx0Tjx1iSzhDndqP8qwl+cccnN/m
	 VUHXD5OXwJQ5Jm0HeG0etX2xLkzEPw0djSKWw++95ZnUnQnTc45gqQe36GKIoTpmuF
	 v//DReeWe2iedyVaignylzPCkPZ0it/t+3xsjyTinWBvdvSulYQ1WtQtZThfTYfS05
	 U5nZGjbVM8cX0R7Lh1TWDvzVTZbekKD/d0sm+/dQnWzMHFE+oITkFOBWsGfA/tHjUv
	 j7eilNaaRHp+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/14] x86/crash: Fix massive out-of-bounds write on
 32-bit Highmem
Reply-To: sashiko-reviews@lists.linux.dev
To: kees@kernel.org, rafael@kernel.org, chao.gao@intel.com, pasha.tatashin@soleen.com, mclapinski@google.com, robh@kernel.org, will@kernel.org, bp@alien8.de, piliu@redhat.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, bgwin@google.com, linux-arm-kernel@lists.infradead.org, rppt@kernel.org, gregkh@linuxfoundation.org, yeoreum.yun@arm.com, hbathini@linux.ibm.com, coxu@redhat.com, chenhuacai@kernel.org, sshegde@linux.ibm.com, tangyouling@kylinos.cn, linuxppc-dev@lists.ozlabs.org, pratyush@kernel.org, graf@amazon.com, mingo@redhat.com, driver-core@lists.linux.dev, thuth@redhat.com, kernel@xen0n.name, vishal.l.verma@intel.com, sourabhjain@linux.ibm.com, kai.huang@intel.com, chleroy@kernel.org, akpm@linux-foundation.org, hpa@zytor.com, guodongtai@kylinos.cn, james.morse@arm.com, eric.devolder@oracle.com, ritesh.list@gmail.com, takahiro.akashi@linaro.org, mark.rutland@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au, tglx@kernel.org, ruirui.yang@linux.dev, leitao@debian.org, lin
 ux-kernel@vger.kernel.org, zhangtianyang@loongson.cn, me@linux.beauty, x86@kernel.org, seanjc@google.com, loongarch@lists.linux.dev, baoquan.he@linux.dev, npiggin@gmail.com, palmer@rivosinc.com, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, maqianga@uniontech.com, jbouron@amazon.com, liukexin@kylinos.cn, dakr@kernel.org
Cc: kexec@lists.infradead.org, ruanjinjie@huawei.com
In-Reply-To: <20260921090450.807575-10-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-10-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:12:57 +0000
Message-Id: <20260921091258.5FEE01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

> On 32-bit x86 systems with HIGHMEM, kmap_local_page() only maps a single
> 4KB page. However, the elfcorehdr segment can span several pages (up to
> hundreds of kilobytes).
>=20
> The original code blindly copies 'elfsz' bytes at once via
> memcpy_flushcache(), overwriting adjacent fixmap entries or critical
> virtual addresses.
>=20
> Fix this by copying the new elfcorehdr page by page.
>=20
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> Cc: Vishal Verma <vishal.l.verma@intel.com>
> Cc: Baoquan He <baoquan.he@linux.dev>
> Cc: Chao Gao <chao.gao@intel.com>
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Eric DeVolder <eric.devolder@oracle.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: stable@vger.kernel.org
> Fixes: ea53ad9cf73b ("x86/crash: add x86 crash hotplug support")
> Link: https://sashiko.dev/#/patchset/20260907125404.922123-1-ruanjinjie%4=
0huawei.com
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921090450.8075=
75-1-ruanjinjie@huawei.com?part=3D9

