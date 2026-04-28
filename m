Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6423230B525
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 07:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362116; cv=none; b=M7CPjo/eEZ/2ZpWeRiURke73MKdKVxNBM5s5xPQfRe82eqAjWGSnp+RgSMryykPPPmcHxFtBQAW9tG90xKSEiqECarYNfMomZMRgdmEFM9JlVmHnV7HfmEbT2fafm86fQoAATIBlT/7AUbva4zs64IKh4eKv2Bed0Xf5W4pIlpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362116; c=relaxed/simple;
	bh=WMHCgOqOjlUt0oCX4M/oOuaiaSOBfbSKjOl0LfDWt3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dmyHOkYk9HmKvCUTHQ9RTri+cpCxX8hseH+BZU3A8jomXZA+GNiEMKgHsb6QmM+0PVYGelncHVG0eelwFax4RoYUfbqwelDf86kAPUR2ErKYXYt3wH9FHuRyaRHtAqxQfRyJJ3QPcVJ5wtNpz+L/gzY+O65wD8cThUZ2WqLmeuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.160.54])
	by gateway (Coremail) with SMTP id _____8AxFem2ZPBpN6sEAA--.9805S3;
	Tue, 28 Apr 2026 15:41:43 +0800 (CST)
Received: from mail-oa1-f54.google.com (unknown [209.85.160.54])
	by front1 (Coremail) with SMTP id qMiowJDxhcCzZPBpGWl2AA--.43070S2;
	Tue, 28 Apr 2026 15:41:40 +0800 (CST)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-42fbf95cca8so4757276fac.0
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 00:41:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8kvZ2YFRpaRkbTUzLlclaBjh/A3Th5Fu3SMxsDvYCxOwKUIRIlTtsAqV/ly/+N6Tpc8qHrIONtmGA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXMRDloRxEPseHKGaWt+PCJrrLppkm1ImTSoj//9rTzIWJ66X2
	TIoNMvkzvvKPejA1XPrTdkxWuoKo43RO4tVrWJ0G2nXYg1IsuzfB4MCif2EdYbKrH40DT79Sehi
	qJIhXTmN99KDtpRbe0lB/bVGpluB5jn+yB4GxEbLD7w==
X-Received: by 2002:a05:690e:190a:b0:654:1a51:81fb with SMTP id
 956f58d0204a3-65beeeb1be9mr1571231d50.54.1777361735728; Tue, 28 Apr 2026
 00:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428070658.1740856-1-chenhuacai@loongson.cn>
In-Reply-To: <20260428070658.1740856-1-chenhuacai@loongson.cn>
From: WANG Rui <wangrui@loongson.cn>
Date: Tue, 28 Apr 2026 15:35:24 +0800
X-Gmail-Original-Message-ID: <CAHirt9gdabrd=PY6aWJQmhueeea7NeeZijP_rP_egnQ+-LKnoQ@mail.gmail.com>
X-Gm-Features: AVHnY4LHHKYAM-CdggXBuVU7P0aRgxS6LW7BD2fviOfr4Fa9_kbmx-W0UCV-eoQ
Message-ID: <CAHirt9gdabrd=PY6aWJQmhueeea7NeeZijP_rP_egnQ+-LKnoQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:qMiowJDxhcCzZPBpGWl2AA--.43070S2
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr47CF43JrW5WFWkJF45CFX_yoW8ZF15p3
	yI9a1kGw4kWrZ2gF9rt345Wr1qqrsxKr4a9a45urWUCF4jqw1DWr4xtFZ8XFnrGw1kCrWI
	gF93Ka47X3WUAwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=

On Tue, Apr 28, 2026 at 3:07=E2=80=AFPM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> Clang/LLVM build needs -m32/-m64 to switch triple variants (i.e. the
> --target=3Dxxx parameter). Otherwise we get build errors for CONFIG_32BIT=
.
>
> GCC doesn't support -m32/-m64 now, but maybe support in future, so use
> cc-option to specify them.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604232041.ESJDwVG4-lkp@i=
ntel.com/
> Suggested-by: Nathan Chancellor <nathan@kernel.org
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Tested-by: WANG Rui <wangrui@loongson.cn>

Both Clang 18 building loongarch64 and Clang 22 building loongarch32
work as expected.

Cheers,
Rui


> ---
>  arch/loongarch/Makefile      | 2 ++
>  arch/loongarch/vdso/Makefile | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index 47516aeea9d2..54fcfa1eac1f 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -55,9 +55,11 @@ endif
>  ifdef CONFIG_32BIT
>  tool-archpref          =3D $(32bit-tool-archpref)
>  UTS_MACHINE            :=3D loongarch32
> +cflags-y               +=3D $(call cc-option,-m32)
>  else
>  tool-archpref          =3D $(64bit-tool-archpref)
>  UTS_MACHINE            :=3D loongarch64
> +cflags-y               +=3D $(call cc-option,-m64)
>  endif
>
>  ifneq ($(SUBARCH),$(ARCH))
> diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
> index 42aa96249828..9c9181bb4071 100644
> --- a/arch/loongarch/vdso/Makefile
> +++ b/arch/loongarch/vdso/Makefile
> @@ -12,6 +12,8 @@ obj-vdso-$(CONFIG_GENERIC_GETTIMEOFDAY) +=3D vgettimeof=
day.o
>  ccflags-vdso :=3D \
>         $(filter -I%,$(KBUILD_CFLAGS)) \
>         $(filter -E%,$(KBUILD_CFLAGS)) \
> +       $(filter -m32,$(KBUILD_CFLAGS)) \
> +       $(filter -m64,$(KBUILD_CFLAGS)) \
>         $(filter -march=3D%,$(KBUILD_CFLAGS)) \
>         $(filter -m%-float,$(KBUILD_CFLAGS)) \
>         $(CLANG_FLAGS) \
> --
> 2.52.0
>
>

