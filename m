Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15B81DAC95
	for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756213429; cv=none; b=kHBciPe61m2iF7VuwD9qJ6sagXxdbYBtTHmIYIo/USpgPVCkgOgFyEZsZFrF4jExVHXY88LBm0roV4f54yJitlm+JsZubKO/fLiMrWBM2jv7vkwQonCEBM9MZAq+FraHnqYuKpXVu9nQBkE0gvgS9ezsHS5ZS+wF/NX5y4i3BR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756213429; c=relaxed/simple;
	bh=nk7jhUwWLjxIbwK4I/zNtqt1MsWdQ36uPPgFbuOgopQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T82I29TyY9GFz8z0nZQE0FQmibc6YKU/bfdMpbZht2wpb9qhFNdOo2nvJPGbkhBbB90mD4zOtSa7n+CJFlZuz5VxUAvpxM7ZE1peblw/mhx5/jTOssUDtMVJ3yG1bxM1KN4lab6aMjSc1CxYWFQosXW5uRxcGGOL6PbRT4Vp448=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pY9gpf5H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pY9gpf5H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A48C4CEF1
	for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 13:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756213428;
	bh=nk7jhUwWLjxIbwK4I/zNtqt1MsWdQ36uPPgFbuOgopQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pY9gpf5H0j/3l6C2f4WZsvzR4T92c+qlxdvZMAibHkC+vbdJc4GVKDkUeQ7RXaaLM
	 lD9O7jaWoO2usnocQHMj7cIs7cvxluZlQ3HHnaS8hKku1z+/8097bVNJq0ptC75717
	 qyubmht8zCWMlWTJy2i6VqL+pEWdeS3TK3Q7ZW4mSvnGpr98rAcNITcsFTiTguoTTl
	 o/f81aZGgROkJJ++wQYKZI5Qs2JacT5t2dsPC6+t5XbuBllU9/AoWk5ybZsVp2KUPt
	 6YwESfLLMLFpClIZt/nqfx0N2VJqW4FaO6dICtTnTodr3QmacO2rAzvl4W8/ka4LPO
	 Eer9rhlPcEJ0w==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61c21e50168so5188105a12.3
        for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 06:03:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUt+pgFnrskGUaumQs9M6r+8PPCZOsqqo/OYNmThYgpD+wWlhFi0guY6tkrp7v88m7GX43JaSW1bws=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXVNZOfTPUGzLuo2ZLDK8k1QvA3kjTYlHyH75zTKgO7/UBsCk0
	8icH8E7dec9BZPKnJ3nOYGKRxc+kInEquXaUIaZbD3OBI9o+dFHczc+MyTdTBeFdXUGaX4PqHC+
	CtnLdal4jRe88KO1EXTuu8yJuov6a8oo=
X-Google-Smtp-Source: AGHT+IE675Ml2VEXdGaR0URYV5LfkjLncmRAXtzDjddNaQF4YVtfzIVT53EfNILVoihSDWLkNi4/+6IxLm6P4iI6ZSs=
X-Received: by 2002:a05:6402:26d0:b0:61c:5474:ffbf with SMTP id
 4fb4d7f45d1cf-61c5474ffdamr7122162a12.33.1756213427061; Tue, 26 Aug 2025
 06:03:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250826064631.9617-1-yangtiezhu@loongson.cn> <20250826064631.9617-2-yangtiezhu@loongson.cn>
 <CAAhV-H5wW_04NHQ7z+SCPb6-T5Hc__n+x=ykg-u9vn4b4GXuww@mail.gmail.com> <487a8149-6cbe-46a7-6771-66aef0045f07@loongson.cn>
In-Reply-To: <487a8149-6cbe-46a7-6771-66aef0045f07@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 26 Aug 2025 21:03:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7m-BSqajDiDNMNEq4FY9uoCd9LZySOe0VQ+2Sv1wZZVg@mail.gmail.com>
X-Gm-Features: Ac12FXznsGPP8wLPZfGYQ1iw7g6utc_zspEM5jjFBXn1rZ2NWCs22HEn7S98enk
Message-ID: <CAAhV-H7m-BSqajDiDNMNEq4FY9uoCd9LZySOe0VQ+2Sv1wZZVg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] objtool/LoongArch: Fix fall through warning about efi_boot_kernel()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 8:33=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2025/8/26 =E4=B8=8B=E5=8D=884:32, Huacai Chen wrote:
> > On Tue, Aug 26, 2025 at 2:46=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> >>
> >> When compiling with LLVM and CONFIG_LTO_CLANG is set, there exists
> >> the following objtool warning:
> >>
> >>    vmlinux.o: warning: objtool: __efistub_efi_boot_kernel()
> >>    falls through to next function __efistub_exit_boot_func()
>
> ...
>
> >> -typedef void __noreturn (*kernel_entry_t)(bool efi, unsigned long cmd=
line,
> >> +typedef void (*kernel_entry_t)(bool efi, unsigned long cmdline,
> >>                                            unsigned long systab);
> >  From my point of view this is incorrect, this function is indeed a
> > noreturn function, and this modification makes LoongArch different to
> > other architectures.
> >
> > Maybe it is better to let objtool ignore the whole
> > drivers/firmware/efi/libstub directory. Because efistub is discarded
> > at runtime so it is useless for stack unwinder.
>
> I tested the following change but there is no effect, the objtool
> warning still exists, this is because OBJECT_FILES_NON_STANDARD
> does not work for link time validation of vmlinux.o according to
> tools/objtool/Documentation/objtool.txt.
Then I think objtool needs to be improved to handle this case, this
problem is not arch specific.

Huacai

>
> diff --git a/drivers/firmware/efi/Makefile b/drivers/firmware/efi/Makefil=
e
> index 8efbcf699e4f..f1fff48eea76 100644
> --- a/drivers/firmware/efi/Makefile
> +++ b/drivers/firmware/efi/Makefile
> @@ -10,6 +10,8 @@
>   #
>   KASAN_SANITIZE_runtime-wrappers.o      :=3D n
>
> +OBJECT_FILES_NON_STANDARD              :=3D y
> +
>   obj-$(CONFIG_ACPI_BGRT)                +=3D efi-bgrt.o
>   obj-$(CONFIG_EFI)                      +=3D efi.o vars.o reboot.o
> memattr.o tpm.o
>   obj-$(CONFIG_EFI)                      +=3D memmap.o
>
> Thanks,
> Tiezhu
>
>
