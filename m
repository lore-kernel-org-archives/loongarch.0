Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC0315A8
	for <loongarch@lists.linux.dev>; Wed, 19 Apr 2023 02:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB5BC4339C
	for <loongarch@lists.linux.dev>; Wed, 19 Apr 2023 02:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681870248;
	bh=GYHhiCs3TCFO1Q2756iuxoVYD2YOA1/S/6qXx4tlCRA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HSEdJXSazY14OL8Cl+nDEnJWvE2k29E5+QeKe+3HZah00pvxiA708sXGELdsIvxpU
	 FCZDSEy2MbnH2nJW+TklX1ErsHuvwbkXmr+U8YgsdNThBwCkwZgeRLEBbbfFVOFAp5
	 uDTaFV1NCZBZoz9MVK31gU5Oo1T5a+L3c4yvhuaZbyVvbGBFywfkmI8/vmCYVa2Cxv
	 5Apvo+v30RzOcVJ5WxNDR4kz3WQvOIcVuBHuO4aXpkDfD27nTs5JdtFWej4t+F+Ew3
	 61clJT8eIV0weQhVjI9f3oxtjyr32/FSlvbw325X90XE1kpB1kVndc4GL6xNpu1faH
	 0iPrQKJNvjxXA==
Received: by mail-ej1-f50.google.com with SMTP id xi5so77881419ejb.13
        for <loongarch@lists.linux.dev>; Tue, 18 Apr 2023 19:10:48 -0700 (PDT)
X-Gm-Message-State: AAQBX9eIs31rN9gDK+rige/59tYQhZM+EuoOLJfpiwepu0mLmCH+H2mE
	LenOpKFnPJf1VodjAh1K3Vto0WZS9qJXyyzGnLM=
X-Google-Smtp-Source: AKy350Yux5eICBg4RaYzzxhXfc38uxr70BMG8PNiecifdwORaLcP13Iwrh9nDaXKtSF4lrUvpBOeBkB9D2J1jtVDDJ8=
X-Received: by 2002:a17:906:5e12:b0:92d:878e:8566 with SMTP id
 n18-20020a1709065e1200b0092d878e8566mr6392709eju.10.1681870246325; Tue, 18
 Apr 2023 19:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230417095950.875228-1-zhaotianrui@loongson.cn> <20230417095950.875228-30-zhaotianrui@loongson.cn>
In-Reply-To: <20230417095950.875228-30-zhaotianrui@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Apr 2023 10:10:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5nxRLzLn65OEnPQJi6CQtFhQOYNZjEE9ZoouM8Ug5hOw@mail.gmail.com>
Message-ID: <CAAhV-H5nxRLzLn65OEnPQJi6CQtFhQOYNZjEE9ZoouM8Ug5hOw@mail.gmail.com>
Subject: Re: [PATCH v7 29/30] LoongArch: KVM: Enable kvm config and add the makefile
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, WANG Xuerui <kernel@xen0n.name>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>, 
	Alex Deucher <alexander.deucher@amd.com>, Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn, 
	Xi Ruoyao <xry111@xry111.site>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tianrui,

On Mon, Apr 17, 2023 at 6:00=E2=80=AFPM Tianrui Zhao <zhaotianrui@loongson.=
cn> wrote:
>
> Enable loongarch kvm config and add the makefile to support build kvm
> module.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304131526.iXfLaVZc-lkp@int=
el.com/
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>  arch/loongarch/Kbuild                      |  1 +
>  arch/loongarch/Kconfig                     |  2 ++
>  arch/loongarch/configs/loongson3_defconfig |  2 ++
>  arch/loongarch/kvm/Kconfig                 | 38 ++++++++++++++++++++++
>  arch/loongarch/kvm/Makefile                | 22 +++++++++++++
>  5 files changed, 65 insertions(+)
>  create mode 100644 arch/loongarch/kvm/Kconfig
>  create mode 100644 arch/loongarch/kvm/Makefile
>
> diff --git a/arch/loongarch/Kbuild b/arch/loongarch/Kbuild
> index b01f5cdb27e0..40be8a1696f9 100644
> --- a/arch/loongarch/Kbuild
> +++ b/arch/loongarch/Kbuild
> @@ -2,6 +2,7 @@ obj-y +=3D kernel/
>  obj-y +=3D mm/
>  obj-y +=3D net/
>  obj-y +=3D vdso/
> +obj-y +=3D kvm/
>
>  # for cleaning
>  subdir- +=3D boot
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 7fd51257e0ed..f9beeb2e0cc9 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -148,6 +148,7 @@ config LOONGARCH
>         select USE_PERCPU_NUMA_NODE_ID
>         select USER_STACKTRACE_SUPPORT
>         select ZONE_DMA32
> +       select HAVE_KVM
Use alpha-betical order, please.

Huacai
>
>  config 32BIT
>         bool
> @@ -588,3 +589,4 @@ source "drivers/acpi/Kconfig"
>  endmenu
>
>  source "drivers/firmware/Kconfig"
> +source "arch/loongarch/kvm/Kconfig"
> diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/=
configs/loongson3_defconfig
> index e18213f01cc4..c99520374aef 100644
> --- a/arch/loongarch/configs/loongson3_defconfig
> +++ b/arch/loongarch/configs/loongson3_defconfig
> @@ -63,6 +63,8 @@ CONFIG_EFI_ZBOOT=3Dy
>  CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=3Dy
>  CONFIG_EFI_CAPSULE_LOADER=3Dm
>  CONFIG_EFI_TEST=3Dm
> +CONFIG_VIRTUALIZATION=3Dy
> +CONFIG_KVM=3Dm
>  CONFIG_MODULES=3Dy
>  CONFIG_MODULE_FORCE_LOAD=3Dy
>  CONFIG_MODULE_UNLOAD=3Dy
> diff --git a/arch/loongarch/kvm/Kconfig b/arch/loongarch/kvm/Kconfig
> new file mode 100644
> index 000000000000..8a999b4c0232
> --- /dev/null
> +++ b/arch/loongarch/kvm/Kconfig
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# KVM configuration
> +#
> +
> +source "virt/kvm/Kconfig"
> +
> +menuconfig VIRTUALIZATION
> +       bool "Virtualization"
> +       help
> +         Say Y here to get to see options for using your Linux host to r=
un
> +         other operating systems inside virtual machines (guests).
> +         This option alone does not add any kernel code.
> +
> +         If you say N, all options in this submenu will be skipped and
> +         disabled.
> +
> +if VIRTUALIZATION
> +
> +config KVM
> +       tristate "Kernel-based Virtual Machine (KVM) support"
> +       depends on HAVE_KVM
> +       select MMU_NOTIFIER
> +       select ANON_INODES
> +       select PREEMPT_NOTIFIERS
> +       select KVM_MMIO
> +       select KVM_GENERIC_DIRTYLOG_READ_PROTECT
> +       select HAVE_KVM_VCPU_ASYNC_IOCTL
> +       select HAVE_KVM_EVENTFD
> +       select SRCU
> +       help
> +         Support hosting virtualized guest machines using hardware
> +         virtualization extensions. You will need a fairly processor
> +         equipped with virtualization extensions.
> +
> +         If unsure, say N.
> +
> +endif # VIRTUALIZATION
> diff --git a/arch/loongarch/kvm/Makefile b/arch/loongarch/kvm/Makefile
> new file mode 100644
> index 000000000000..2335e873a6ef
> --- /dev/null
> +++ b/arch/loongarch/kvm/Makefile
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for LOONGARCH KVM support
> +#
> +
> +ccflags-y +=3D -I $(srctree)/$(src)
> +
> +include $(srctree)/virt/kvm/Makefile.kvm
> +
> +obj-$(CONFIG_KVM) +=3D kvm.o
> +
> +kvm-y +=3D main.o
> +kvm-y +=3D vm.o
> +kvm-y +=3D vmid.o
> +kvm-y +=3D tlb.o
> +kvm-y +=3D mmu.o
> +kvm-y +=3D vcpu.o
> +kvm-y +=3D exit.o
> +kvm-y +=3D interrupt.o
> +kvm-y +=3D timer.o
> +kvm-y +=3D switch.o
> +kvm-y +=3D csr_ops.o
> --
> 2.31.1
>
