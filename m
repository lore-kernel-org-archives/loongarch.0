Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC0739AC5
	for <loongarch@lists.linux.dev>; Mon, 22 Jan 2024 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705915065; cv=none; b=MmJZoyrM0GYtJGktq+NYYeE4NJITkMO4TIesj1mo5g9NEr2YcQvjEZEcF3rIwJCUo7Qf5zEla1mXP3nXTs8pkVqRUY+GikIEZLzebUWW3GJCP1ZS2DlG0EFnhYyAvvbQ2BILvLzsaC00weV7IXjh/PRR0k2+gGb2gu/CKvZ7pPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705915065; c=relaxed/simple;
	bh=GknMIjNfk3Q+3O5vnCYZusLGMvB08sdNWHOHlOIKyJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0E1tpIRbcUzPT0OxXmep+C4DUu8wCb0jgWy+49OXLZDqOfHINy4W6a0IxYLyVYirc4yq9aQRzACtu2aZxs+Dxk+JYK1OrmM/JkaSX1l9dzkIVUaOeOMiQQ5/scAAiaf71Zghuam7x7KJIiBaSVU+oRMyI1uTNh6HEh4DMoAqn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=mTGoW4ui; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="mTGoW4ui"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5ffb07bed9bso7201887b3.0
        for <loongarch@lists.linux.dev>; Mon, 22 Jan 2024 01:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705915063; x=1706519863; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BroRkqnuO0Oy9O6+ZA0zuSl/25g6dyXPAFX1tfI4BB4=;
        b=mTGoW4uiV8WzUiOs+GyQsE7Xxu9/sBTOHJ38NfP/LDmxcNtcffw81P6/w3NXZLGjdb
         E+WZzPHPFbmYQzJEm1C0vFJ5Vcsfcv2H7LYhDvymfnL6tKwVUuZE68RL3sO6VZ2upAtv
         gUE/LUaGfgyGfxoanSxp/kOrTPOnR25YW9n5TGs4DFlkGpDX+Zgf5D32Pkp0Qtzb0Apw
         ReB9sk/dRjDuuVEGVhc/66tBuM5cZbsKD7EucYnwfN/Y6Q7kgWxMxnJEpDxCQBXuWWr6
         dFk1xBzLZmkyoJ2IVsydLmnDdeqeeTo4yCWfLuMOl/AC6G22bsaIDCmYYt6eyE6OsLpk
         0DPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705915063; x=1706519863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BroRkqnuO0Oy9O6+ZA0zuSl/25g6dyXPAFX1tfI4BB4=;
        b=M9OTjfwi/7l0oON8R/XgViVT3IyMbOiIrMQvzSPkxweanb+XZELTEDDZA23lGCkUC5
         XkeL4OuQ+PT2E4Da1f2kzdKYpQO9/HWixEd3j4wZ/1PBix6iHRFjC51CZ0cddsTjOuu/
         T2szLzt/F/ErIPCi34nTsetQf11u7GhoVBkSelsB7baQStyPnJctyG1HwFLpC5+IYMUu
         rz+Owp1hyh41vdpwPpIwKSNHDGMludb6a1ctki7Sp+S+LIOlHhUTYiw3AkGTJEFmCpj2
         +8O7PrzYge5JaZFjy6nItyLhY89iy8WsN1+DROBiv1fzslEf9hKWPBNKFrMZ8Vd/Y3fH
         RjUA==
X-Gm-Message-State: AOJu0Yzuf0sqaRVUe3eUVk1lJ5Cah+kT3T8JRZkgiH3IIIAPOxV1Wa+8
	HISxOsOCHuh7hibOlt1whC9v87CMuFFMemtCbBDzmHyZ+PJtL0QGjc99S1a7uzO9wG/54TRCT5C
	5+/CdEhmq+TD/B3Ts4ee9QX8uOeZTM9QICHZFQQ==
X-Google-Smtp-Source: AGHT+IFg78aukicmcCb2fnJ5R9FQfLOdTdmjXGaSLvdppwU8sjOMbNpvwM8AI+ULHMD/rR0Ozx5UvcvwHM4zryjp3NA=
X-Received: by 2002:a81:bf51:0:b0:5ff:7f45:3933 with SMTP id
 s17-20020a81bf51000000b005ff7f453933mr1605802ywk.80.1705915062981; Mon, 22
 Jan 2024 01:17:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com> <20231020155056.3495121-2-Jamie.Cunliffe@arm.com>
In-Reply-To: <20231020155056.3495121-2-Jamie.Cunliffe@arm.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 22 Jan 2024 03:17:31 -0600
Message-ID: <CALNs47vzQm5MbfJtMQR3p+W1xub3KHiNqRgEQGWT3u28fpQ-oA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com, andrew@lunn.ch, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 10:59=E2=80=AFAM Jamie Cunliffe <Jamie.Cunliffe@arm=
.com> wrote:
>
> Eventually we want all architectures to be using the target as defined
> by rustc. However currently some architectures can't do that and are
> using the target.json specification. This puts in place the foundation
> to allow the use of the builtin target definition or a target.json
> specification.
>
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> ---
>  Makefile          | 1 -
>  arch/x86/Makefile | 1 +
>  rust/Makefile     | 5 ++++-
>  scripts/Makefile  | 4 +++-
>  4 files changed, 8 insertions(+), 3 deletions(-)

Adding LoongArch maintainers - this patch will need a small update to
arch/loongarch/Makefile similar to the change in arch/x86/Makefile
(included below), since that support is now in-tree and uses
generate_rust_target [1]. Also a very minor conflict in docs at patch
2/2.

I believe this patchset is still waiting on an ack from the kbuild
team. Series at [2] for reference.

Thanks,
Trevor

[1]: https://lore.kernel.org/rust-for-linux/20240108032117.215171-1-wangrui=
@loongson.cn/
[2]: https://lore.kernel.org/rust-for-linux/20231020155056.3495121-1-Jamie.=
Cunliffe@arm.com/

> diff --git a/Makefile b/Makefile
> index 88ebf6547964..23100f193da3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -566,7 +566,6 @@ KBUILD_CFLAGS +=3D -fno-strict-aliasing
>
>  KBUILD_CPPFLAGS :=3D -D__KERNEL__
>  KBUILD_RUSTFLAGS :=3D $(rust_common_flags) \
> -                   --target=3D$(objtree)/scripts/target.json \
>                     -Cpanic=3Dabort -Cembed-bitcode=3Dn -Clto=3Dn \
>                     -Cforce-unwind-tables=3Dn -Ccodegen-units=3D1 \
>                     -Csymbol-mangling-version=3Dv0 \
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 5bfe5caaa444..0f339d4abd40 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -68,6 +68,7 @@ export BITS
>  #    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D53383
>  #
>  KBUILD_CFLAGS +=3D -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
> +KBUILD_RUSTFLAGS +=3D --target=3D$(objtree)/scripts/target.json
>  KBUILD_RUSTFLAGS +=3D -Ctarget-feature=3D-sse,-sse2,-sse3,-ssse3,-sse4.1=
,-sse4.2,-avx,-avx2
>
>  ifeq ($(CONFIG_X86_KERNEL_IBT),y)
> diff --git a/rust/Makefile b/rust/Makefile
> index 87958e864be0..8d75a6ffe951 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -428,8 +428,11 @@ $(obj)/core.o: private skip_clippy =3D 1
>  $(obj)/core.o: private skip_flags =3D -Dunreachable_pub
>  $(obj)/core.o: private rustc_objcopy =3D $(foreach sym,$(redirect-intrin=
sics),--redefine-sym $(sym)=3D__rust$(sym))
>  $(obj)/core.o: private rustc_target_flags =3D $(core-cfgs)
> -$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs scripts/target.json FORCE
> +$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
>         $(call if_changed_dep,rustc_library)
> +ifdef CONFIG_X86_64
> +$(obj)/core.o: scripts/target.json
> +endif
>
>  $(obj)/compiler_builtins.o: private rustc_objcopy =3D -w -W '__*'
>  $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FO=
RCE
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 576cf64be667..c85d130a4125 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -11,12 +11,14 @@ hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)         =
       +=3D sign-file
>  hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)    +=3D insert-sys-c=
ert
>  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)                +=3D rust=
doc_test_builder
>  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)                +=3D rust=
doc_test_gen
> -always-$(CONFIG_RUST)                                  +=3D target.json
>
> +ifdef CONFIG_X86_64
> +always-$(CONFIG_RUST)                                  +=3D target.json
>  filechk_rust_target =3D $< < include/config/auto.conf
>
>  $(obj)/target.json: scripts/generate_rust_target include/config/auto.con=
f FORCE
>         $(call filechk,rust_target)
> +endif
>
>  hostprogs +=3D generate_rust_target
>  generate_rust_target-rust :=3D y
> --
> 2.30.2
>
>
