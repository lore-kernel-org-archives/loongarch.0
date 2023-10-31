Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D50B1DDE0
	for <loongarch@lists.linux.dev>; Tue, 31 Oct 2023 14:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y/23c6aF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698761373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSrlOFadgRmkp59Ps7hIlpBA3Ozc75gF0uiWtS5xZoA=;
	b=Y/23c6aFjjs3bhvH84JvOZiYdApSznDOBFfWjNjzF1txxrmdM/zm6h+j0ObO6LpUBr/AY5
	4V8MNn1mcaSju1Mi892LXAvUBiylEXCpoY7h7BcI4T3uopULE+8R6ciaZCy0XRpSbTbXEI
	n1Oqu+z0eqRa9L1+p17+hJkB/WbAwbw=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-BplohA46OV21dvMxYjSpXw-1; Tue, 31 Oct 2023 10:09:30 -0400
X-MC-Unique: BplohA46OV21dvMxYjSpXw-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1e9c2c00182so7489121fac.1
        for <loongarch@lists.linux.dev>; Tue, 31 Oct 2023 07:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698761370; x=1699366170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSrlOFadgRmkp59Ps7hIlpBA3Ozc75gF0uiWtS5xZoA=;
        b=TYdgB8O9U4Bcb/Kvoh4xbTqh7/NHTotV/VUwd1KSD4p0Wm/hnvVuTxHpcPD5Orbkzh
         uKTCkRJ+j1pm0Pc2N/D0JZDhk4afNkAGgpN70R5txOsiFKz7f9ha+I+7gSxZQ3mCwSPO
         vgWMRaBD5t5mFpjVC5GY30vHvhlBaX9AmT2Yh5tHbdGiYfUCCw+T2xNLvAYd8A/7GJ5L
         ZnRx3ghSFhlfPwpGKox0YHh1TFlo0r1ALIP72OkOe0zljdvCGxJVnaItfWEuik5IWAN1
         YY90lC4dIH6pKCHhHrBfyQSCV3jN8Ew3/y8RsE9W2Z47U3cBIXhCpEsO0jAv97FqCLTJ
         RlKg==
X-Gm-Message-State: AOJu0Yz6sVBKA5rqGn+2CGEBQeUPQwjI6oZG2UHcXVTzI/5lVcJuKLJg
	uAIW/cZJc14RJCS++maqUZKvU5usn2VQrbOlCnA8uG9c/LW0WCT97nkh3liZcLL7Tcyeatp0xqG
	VZuYSC3zNhKmGvcKRdOZX46jig0hzfD/hA2Az
X-Received: by 2002:a05:6870:180d:b0:1e9:c18b:b2da with SMTP id t13-20020a056870180d00b001e9c18bb2damr14768263oaf.18.1698761369992;
        Tue, 31 Oct 2023 07:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH5Kh6RCGV+88rrPsi6GN5YEaQ4HK/udqjWpjbov/sleXyyQzFEyt1SUvx/PitO+ubDGHgzNiGoOwUb15AZaU=
X-Received: by 2002:a05:6870:180d:b0:1e9:c18b:b2da with SMTP id
 t13-20020a056870180d00b001e9c18bb2damr14768241oaf.18.1698761369717; Tue, 31
 Oct 2023 07:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005091825.3207300-1-chenhuacai@loongson.cn>
In-Reply-To: <20231005091825.3207300-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 31 Oct 2023 15:09:17 +0100
Message-ID: <CABgObfZt+bEV2Ho5guX3=2eqJnBxt01D5tp6J-_VZuK1=JiWew@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.7
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023 at 11:28=E2=80=AFAM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0=
aa:
>
>   Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git tags/loongarch-kvm-6.7
>
> for you to fetch changes up to 2c10cda4b777be4be9d9e69e4f70c818dbb15e21:
>
>   LoongArch: KVM: Add maintainers for LoongArch KVM (2023-10-02 10:01:29 =
+0800)

Pulled, thanks.

Paolo

>
> ----------------------------------------------------------------
> LoongArch KVM changes for v6.7
>
> Add LoongArch's KVM support. Loongson 3A5000/3A6000 supports hardware
> assisted virtualization. With cpu virtualization, there are separate
> hw-supported user mode and kernel mode in guest mode. With memory
> virtualization, there are two-level hw mmu table for guest mode and host
> mode. Also there is separate hw cpu timer with consant frequency in
> guest mode, so that vm can migrate between hosts with different freq.
> Currently, we are able to boot LoongArch Linux guests.
>
> Few key aspects of KVM LoongArch added by this series are:
> 1. Enable kvm hardware features when kvm module is loaded.
> 2. Implement VM and vcpu related ioctl interface such as vcpu create,
>    vcpu run etc. GET_ONE_REG/SET_ONE_REG ioctl commands are use to
>    get general registers one by one.
> 3. Hardware access about MMU, timer and csr are emulated in kernel.
> 4. Hardwares such as mmio and iocsr device are emulated in user space
>    such as IPI, irqchips, pci devices etc.
>
> ----------------------------------------------------------------
> Tianrui Zhao (25):
>       LoongArch: KVM: Add kvm related header files
>       LoongArch: KVM: Implement kvm module related interface
>       LoongArch: KVM: Implement kvm hardware enable, disable interface
>       LoongArch: KVM: Implement VM related functions
>       LoongArch: KVM: Add vcpu related header files
>       LoongArch: KVM: Implement basic vcpu interfaces
>       LoongArch: KVM: Implement basic vcpu ioctl interfaces
>       LoongArch: KVM: Implement fpu operations for vcpu
>       LoongArch: KVM: Implement vcpu interrupt operations
>       LoongArch: KVM: Implement vcpu load and vcpu put operations
>       LoongArch: KVM: Implement misc vcpu related interfaces
>       LoongArch: KVM: Implement vcpu timer operations
>       LoongArch: KVM: Implement virtual machine tlb operations
>       LoongArch: KVM: Implement kvm mmu operations
>       LoongArch: KVM: Implement handle csr exception
>       LoongArch: KVM: Implement handle iocsr exception
>       LoongArch: KVM: Implement handle idle exception
>       LoongArch: KVM: Implement handle gspr exception
>       LoongArch: KVM: Implement handle mmio exception
>       LoongArch: KVM: Implement handle fpu exception
>       LoongArch: KVM: Implement kvm exception vectors
>       LoongArch: KVM: Implement vcpu world switch
>       LoongArch: KVM: Enable kvm config and add the makefile
>       LoongArch: KVM: Supplement kvm document about LoongArch-specific pa=
rt
>       LoongArch: KVM: Add maintainers for LoongArch KVM
>
>  Documentation/virt/kvm/api.rst             |  70 ++-
>  MAINTAINERS                                |  12 +
>  arch/loongarch/Kbuild                      |   2 +
>  arch/loongarch/Kconfig                     |   6 +
>  arch/loongarch/configs/loongson3_defconfig |   2 +
>  arch/loongarch/include/asm/inst.h          |  16 +
>  arch/loongarch/include/asm/kvm_csr.h       | 211 +++++++
>  arch/loongarch/include/asm/kvm_host.h      | 237 ++++++++
>  arch/loongarch/include/asm/kvm_mmu.h       | 139 +++++
>  arch/loongarch/include/asm/kvm_types.h     |  11 +
>  arch/loongarch/include/asm/kvm_vcpu.h      |  93 +++
>  arch/loongarch/include/asm/loongarch.h     |  19 +-
>  arch/loongarch/include/uapi/asm/kvm.h      | 108 ++++
>  arch/loongarch/kernel/asm-offsets.c        |  32 +
>  arch/loongarch/kvm/Kconfig                 |  40 ++
>  arch/loongarch/kvm/Makefile                |  22 +
>  arch/loongarch/kvm/exit.c                  | 696 +++++++++++++++++++++
>  arch/loongarch/kvm/interrupt.c             | 183 ++++++
>  arch/loongarch/kvm/main.c                  | 420 +++++++++++++
>  arch/loongarch/kvm/mmu.c                   | 914 +++++++++++++++++++++++=
+++++
>  arch/loongarch/kvm/switch.S                | 250 ++++++++
>  arch/loongarch/kvm/timer.c                 | 197 ++++++
>  arch/loongarch/kvm/tlb.c                   |  32 +
>  arch/loongarch/kvm/trace.h                 | 162 +++++
>  arch/loongarch/kvm/vcpu.c                  | 939 +++++++++++++++++++++++=
++++++
>  arch/loongarch/kvm/vm.c                    |  94 +++
>  include/uapi/linux/kvm.h                   |   9 +
>  27 files changed, 4902 insertions(+), 14 deletions(-)
>  create mode 100644 arch/loongarch/include/asm/kvm_csr.h
>  create mode 100644 arch/loongarch/include/asm/kvm_host.h
>  create mode 100644 arch/loongarch/include/asm/kvm_mmu.h
>  create mode 100644 arch/loongarch/include/asm/kvm_types.h
>  create mode 100644 arch/loongarch/include/asm/kvm_vcpu.h
>  create mode 100644 arch/loongarch/include/uapi/asm/kvm.h
>  create mode 100644 arch/loongarch/kvm/Kconfig
>  create mode 100644 arch/loongarch/kvm/Makefile
>  create mode 100644 arch/loongarch/kvm/exit.c
>  create mode 100644 arch/loongarch/kvm/interrupt.c
>  create mode 100644 arch/loongarch/kvm/main.c
>  create mode 100644 arch/loongarch/kvm/mmu.c
>  create mode 100644 arch/loongarch/kvm/switch.S
>  create mode 100644 arch/loongarch/kvm/timer.c
>  create mode 100644 arch/loongarch/kvm/tlb.c
>  create mode 100644 arch/loongarch/kvm/trace.h
>  create mode 100644 arch/loongarch/kvm/vcpu.c
>  create mode 100644 arch/loongarch/kvm/vm.c
>

