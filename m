Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC07B3EFD06;
	Fri, 24 Apr 2026 18:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777054797; cv=none; b=okpr78ruMvERgfadO3v/cc6YTqlcHv5Cpqdl7XQh8Bf6XTwJvzzoSsMEA8wNey6XmhBZmAnzGeFR1dPzpXreYVeUqIPqZmctSsfyVcI/RkftmUY3XsykRePFfuYlUARZh7w/S5CNIXMLWRRbuaM9jkd9f2hgKsRMwI2y4HyBzeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777054797; c=relaxed/simple;
	bh=7EzJWOO5kLUgIR9LJQskmJCztK7/4SKiDtytU0KpJMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPxYhyJifMlftmJKCY030QXqbHozlE6Wn2iCgPqQzCYK2WKQ2ys4YbchUCvMe5GJ7NR8tTQu+eWrn73afsxbPgMN3jz9dTBM5mfznFNlnA0YbYW0THfDnTaaEN4EWbkiK0ILP83Ggy2REFQ4iVMwqrFhdjtDNwUEkFp0U9CCdVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkAAFyHJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkAAFyHJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38584C19425;
	Fri, 24 Apr 2026 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777054796;
	bh=7EzJWOO5kLUgIR9LJQskmJCztK7/4SKiDtytU0KpJMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rkAAFyHJGwW99S9+Wf4J9Ex8pzbkzaD1pCbg8QIBCJ9S0Y2AOCCQaSssfpc7Jcqfg
	 YG69XSuVuOUCa8hiOqJ2mssgJtVUe8FGm44mQPfntXAA4fBUKd1vJ0YqszHooQ1v6K
	 UxwUeYLI/Zsc71QH7wsPvVWbJi4FH2WiwPa4ie3P5cu6j3kgP1Ta9hNFqPRprluLLa
	 /1JRvXSUV8znWMDxLR3GponRZecHMTroODQqFymvnfRjpOj7WLD6h7QQitTv78v3gk
	 erjnZ0ktUX0tJb17Qkd9EOsAe8buQctW/ZM8D7LPUPKV5Hlc9pONjKEWCPBBzSYcFc
	 R1BgXU/841eLA==
Date: Fri, 24 Apr 2026 11:19:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: WANG Rui <r@hev.cc>
Cc: arnd@arndb.de, chenhuacai@kernel.org, chenhuacai@loongson.cn,
	guoren@kernel.org, jiaxun.yang@flygoat.com, kernel@xen0n.name,
	linux-kernel@vger.kernel.org, lixuefeng@loongson.cn,
	loongarch@lists.linux.dev
Subject: Re: [PATCH V4 14/14] LoongArch: Adjust build infrastructure for
 32BIT/64BIT
Message-ID: <20260424181951.GA813908@ax162>
References: <20260423220647.GA3447678@ax162>
 <20260424110624.48510-1-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424110624.48510-1-r@hev.cc>

Hi Rui,

On Fri, Apr 24, 2026 at 07:06:23PM +0800, WANG Rui wrote:
> > As a result of the above problem, I see
> > 
> >   clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
> >   clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
> >   clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
> > 
> > when building configurations that I expected to be 64-bit but had been
> > turned into 32-bit ones with LLVM. This was also reported by the test
> > robot with allnoconfig.
> > 
> >   https://lore.kernel.org/202604232041.ESJDwVG4-lkp@intel.com/
> > 
> > Maybe some change is needed on the LLVM side?
> 
> The root cause is that scripts/Makefile.clang unconditionally sets
> CLANG_TARGET_FLAGS_loongarch to loongarch64-linux-gnusf.
> However, Clang with --target=loongarch64 does not support a 32-bit ABI.
> LLVM clearly separates loongarch32 and loongarch64 targets.
> 
> Since CLANG_TARGET_FLAGS gets initialized before CONFIG is available, the
> current setup effectively assumes that a 64-bit target must also handle
> a 32-bit ABI. That assumption may not hold for LLVM, which models 32-bit
> and 64-bit LoongArch as separate targets.

Hmmm, okay, that definitely explains it. As the comment at the top of
scripts/Makefile.clang states, we rely on targets supporting switching
their word size via '-m32' / '-m64' so that we can use a 64-bit triple
but still get a 32-bit one if necessary. For example:

  --target=x86_64-linux-gnu -m32

effectively becomes

  --target=i386-linux-gnu

It seems like this works for LoongArch in clang as well?

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 47516aeea9d2..2837004d0d75 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -67,6 +67,9 @@ ifneq ($(SUBARCH),$(ARCH))
 endif
 
 ifdef CONFIG_32BIT
+ifdef CONFIG_CC_IS_CLANG
+cflags-y		+= -m32
+endif
 ifdef CONFIG_32BIT_STANDARD
 ld-emul			= $(32bit-emul)
 cflags-y		+= -march=la32v1.0 -mabi=ilp32s -mcmodel=normal
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index 42aa96249828..eeda13ecb711 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -14,6 +14,7 @@ ccflags-vdso := \
 	$(filter -E%,$(KBUILD_CFLAGS)) \
 	$(filter -march=%,$(KBUILD_CFLAGS)) \
 	$(filter -m%-float,$(KBUILD_CFLAGS)) \
+	$(filter -m32,$(KBUILD_CFLAGS)) \
 	$(CLANG_FLAGS) \
 	-D__VDSO__
 
--

appears to do the right thing?

  $ make -skj"$(nproc)" ARCH=loongarch LLVM=1 mrproper loongarch32_defconfig all

  $ file vmlinux arch/loongarch/boot/vmlinux.efi
  vmlinux:                         ELF 32-bit LSB executable, LoongArch, version 1 (SYSV), statically linked, BuildID[sha1]=26b4af26bb14c923270429f4ccdc66a519c059b1, not stripped
  arch/loongarch/boot/vmlinux.efi: PE32+ executable for EFI (application), LoongArch 32-bit (stripped to external PDB), 2 section

Cheers,
Nathan
