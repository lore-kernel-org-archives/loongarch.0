Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEF8185C
	for <loongarch@lists.linux.dev>; Wed, 25 Oct 2023 02:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uH4cNl8K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA06C433C7
	for <loongarch@lists.linux.dev>; Wed, 25 Oct 2023 02:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698199839;
	bh=MEW/6MGCX1XZaqEbTH7Tu3kHTVovAqY5DrZ29wr8Xew=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uH4cNl8Kw4fsOajNr7Apq3a9x7Mz4PRem/rdu9LNOqEbIOgzfW2BbLbVuGy/biovl
	 QRhz06szqJD04u3hqsYEnp7iItdAGSvtwhGCCFROSiDp9vZBz62wo3804WG83PwSNj
	 hpH1IM/EOjB0SGjKkN8EXLm93CXok2rEzDQ7FHf6SLHoDbFocR0gdmeMIgkAydLzBu
	 dXdneNdkizIdig7DPIz2AWdn8tRnmMafpJqSmobTzYbq+v37jcwL9PskYhXox/rg8L
	 9hA7MvauTgLNdBfQfyoDW9cbADe0ZtFaqed519bCR4dA71RFCIwg8OGRDOhGM2i6c6
	 etw1dYIIEbelQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso7790341a12.1
        for <loongarch@lists.linux.dev>; Tue, 24 Oct 2023 19:10:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YwMqRT6cX8XnMJA+3lGVjgz4xza42y00Z9ia3GEYh7j70BcU42H
	5ifPKvH71b+0cq6HrapG3VQ/7wb45ZgVruuLS6k=
X-Google-Smtp-Source: AGHT+IHx3K+HatlpnfYDCA4LL8aasoDk7hNaKKs2ktPpRhp8Xe2rQ89gQQG/ypsb3z8kBq6bcJ2FzuNuerxr24R97os=
X-Received: by 2002:a17:906:fe4c:b0:9ba:a38:f2b2 with SMTP id
 wz12-20020a170906fe4c00b009ba0a38f2b2mr11705086ejb.41.1698199838119; Tue, 24
 Oct 2023 19:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005091825.3207300-1-chenhuacai@loongson.cn>
In-Reply-To: <20231005091825.3207300-1-chenhuacai@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 25 Oct 2023 10:10:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7VN_r-SzEMK6LHqXzVbNemZYuYYLb2mri=EGZ7qb3C3A@mail.gmail.com>
Message-ID: <CAAhV-H7VN_r-SzEMK6LHqXzVbNemZYuYYLb2mri=EGZ7qb3C3A@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.7
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Paolo,

Excuse me, but this is just a gentle reminder. The 6.7 merge window is
coming soon, have you missed this PR mail? Or should I rebase to
6.6-rc7 to send a new PR (a randconfig build error is fixed in
6.6-rc7)?

Huacai

On Thu, Oct 5, 2023 at 5:18=E2=80=AFPM Huacai Chen <chenhuacai@loongson.cn>=
 wrote:
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
