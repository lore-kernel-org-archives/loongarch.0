Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4E11B0F04
	for <loongarch@lists.linux.dev>; Thu, 14 Nov 2024 23:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731628399; cv=none; b=PS4oXF0abZn2Pvp8DlAGY6Rus19L/uFKU90aTpw2zVy9B4uSTuaPgnZblEwfRwP+LW3Bqtk37iZ5gJxnRaioe6X+UW80rvGW3lGa4k0zZ10CYUA9ZrgTunw4k31a9OKGR0te+AU09oP5aTq5CBiLGHTmYp5u4fnd6Hm3AzQ7irU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731628399; c=relaxed/simple;
	bh=/ICuXM+GV6dBITrJIBgI7/tWym7FEU0Fxzozxfuppnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mj+LHu53KSYNxY71BYnKzq4CtQAZwRfX6AnMaFxi4LpChZwB6mTJq16KovAzbh/gCXlO6rcZSZdWx8ixPTrMQKjEAiinxYASbbtFS06Pp+Oq6h1guiUhFldWYg98id96P3AgffosERAsPY2vTlis8HanQP2eKNsrwtEWY8F/TLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JP7UpWZy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JP7UpWZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731628396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rECe5FJajV/VYN0/GaapttFhgwn5vtFillXTURUY7NE=;
	b=JP7UpWZyY3ejQhYAFhMXLwzPlDp5DofigzwNX/TcSG3wDr8lAeOYALEMHzL+KDSGHfVHTt
	xlq1uduwiCEQk9hQMv32aruhpQXut3cZ4qVDlov7hAP4n7nIxvcNzKixFGcogo4XFT0Dh4
	VMv36IZrPCT42Yy1QoqOXNlND8gieMI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-S57Aomi4Mq6BD2oZ76zkcw-1; Thu, 14 Nov 2024 18:53:15 -0500
X-MC-Unique: S57Aomi4Mq6BD2oZ76zkcw-1
X-Mimecast-MFC-AGG-ID: S57Aomi4Mq6BD2oZ76zkcw
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3821e53ff45so480200f8f.3
        for <loongarch@lists.linux.dev>; Thu, 14 Nov 2024 15:53:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731628394; x=1732233194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rECe5FJajV/VYN0/GaapttFhgwn5vtFillXTURUY7NE=;
        b=ROisoA8vu0r0VWnLT2XxUurc0Bw/OsKWQsBU5Cm4EukUsLqo4sbaOsYRSzb/hetBlA
         b13HDO0CL46Yj9uVM3mhRlRVD1lr/c5T649CR/doJxi/xPvPqQZ3z60nP4ot+6kZtG/N
         BS6Gz9ApO+uEmFO7xS8JIwTQrwEdWN+6AydssqNtf3Q34vXkJ+ZHBQP8KyToOi4DLglJ
         2lqolXu4yR4gBW9R1mnKvmin2N3WIg8TGr+zDaXWpQrwpUXLom0wZ39IAiIYaVlxFO4e
         siO+Og0Zrf7xzB5yvyU9lVH4+jrCauNFYlKT4+qKpnwRB+a9M9OIUb9qaUjDov3yCcAy
         w7jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVootkaRqdd3kxqIFyImxjZXskiyGjHzL26YRwKZlCH28o4NkOa5HlBe6pD2u4byFfH5LExZzavPz8=@lists.linux.dev
X-Gm-Message-State: AOJu0YySEOsHXI5Emm3d2FDGEFcfH1zfTozwx6Xre5m8Yx9v1KyL1sSr
	93gNHFL1fXcy2RwnQ/tD4K3tOe9kunn3L7E8rKOyGYNvpCSoXV8XRo/ksFsfhE+/3bu2bUsL7R9
	an6Etjn0K4bMtrm9i5X8xjtqUekT3MgOrMdHGMjnCz9xLGucHtUKZ6z1r10CGaNQphZnjVLHIbQ
	fpQ9XMmwda998mSoxczdecSJo9jmBWisSH+2Mdi30BzsrNZw==
X-Received: by 2002:a05:6000:156b:b0:374:c17a:55b5 with SMTP id ffacd0b85a97d-38225907519mr413185f8f.14.1731628393804;
        Thu, 14 Nov 2024 15:53:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKwOuvExVXPmSQhtLCT0FzFyo78jxZHYmPrEQdpvPU+torab91q63PrU3gZsTPFt//8kyo2JOBpOrw6eK7KKk=
X-Received: by 2002:a05:6000:156b:b0:374:c17a:55b5 with SMTP id
 ffacd0b85a97d-38225907519mr413177f8f.14.1731628393484; Thu, 14 Nov 2024
 15:53:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241114094128.2198306-1-chenhuacai@loongson.cn>
In-Reply-To: <20241114094128.2198306-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 15 Nov 2024 00:53:00 +0100
Message-ID: <CABgObfbLYfAo=PGNPxEJXrttM575JeSV265madXmN2uuZEFqfQ@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.13
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WHbrCejc-jAQgeA9_jp4PE1035-BC3PB5FSBT_EA8no_1731628394
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 10:50=E2=80=AFAM Huacai Chen <chenhuacai@loongson.c=
n> wrote:
>
> The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae54566=
23:
>
>   Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git tags/loongarch-kvm-6.13
>
> for you to fetch changes up to 9899b8201025d00b23aee143594a30c55cc4cc35:
>
>   irqchip/loongson-eiointc: Add virt extension support (2024-11-13 16:18:=
27 +0800)

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> LoongArch KVM changes for v6.13
>
> 1. Add iocsr and mmio bus simulation in kernel.
> 2. Add in-kernel interrupt controller emulation.
> 3. Add virt extension support for eiointc irqchip.
>
> ----------------------------------------------------------------
> Bibo Mao (1):
>       irqchip/loongson-eiointc: Add virt extension support
>
> Xianglai Li (11):
>       LoongArch: KVM: Add iocsr and mmio bus simulation in kernel
>       LoongArch: KVM: Add IPI device support
>       LoongArch: KVM: Add IPI read and write function
>       LoongArch: KVM: Add IPI user mode read and write function
>       LoongArch: KVM: Add EIOINTC device support
>       LoongArch: KVM: Add EIOINTC read and write functions
>       LoongArch: KVM: Add EIOINTC user mode read and write functions
>       LoongArch: KVM: Add PCHPIC device support
>       LoongArch: KVM: Add PCHPIC read and write functions
>       LoongArch: KVM: Add PCHPIC user mode read and write functions
>       LoongArch: KVM: Add irqfd support
>
>  Documentation/arch/loongarch/irq-chip-model.rst    |   64 ++
>  .../zh_CN/arch/loongarch/irq-chip-model.rst        |   55 ++
>  arch/loongarch/include/asm/irq.h                   |    1 +
>  arch/loongarch/include/asm/kvm_eiointc.h           |  123 +++
>  arch/loongarch/include/asm/kvm_host.h              |   18 +-
>  arch/loongarch/include/asm/kvm_ipi.h               |   45 +
>  arch/loongarch/include/asm/kvm_pch_pic.h           |   62 ++
>  arch/loongarch/include/uapi/asm/kvm.h              |   20 +
>  arch/loongarch/kvm/Kconfig                         |    5 +-
>  arch/loongarch/kvm/Makefile                        |    4 +
>  arch/loongarch/kvm/exit.c                          |   82 +-
>  arch/loongarch/kvm/intc/eiointc.c                  | 1027 ++++++++++++++=
++++++
>  arch/loongarch/kvm/intc/ipi.c                      |  475 +++++++++
>  arch/loongarch/kvm/intc/pch_pic.c                  |  519 ++++++++++
>  arch/loongarch/kvm/irqfd.c                         |   89 ++
>  arch/loongarch/kvm/main.c                          |   19 +-
>  arch/loongarch/kvm/vcpu.c                          |    3 +
>  arch/loongarch/kvm/vm.c                            |   21 +
>  drivers/irqchip/irq-loongson-eiointc.c             |  108 +-
>  include/linux/kvm_host.h                           |    1 +
>  include/trace/events/kvm.h                         |   35 +
>  include/uapi/linux/kvm.h                           |    8 +
>  22 files changed, 2735 insertions(+), 49 deletions(-)
>  create mode 100644 arch/loongarch/include/asm/kvm_eiointc.h
>  create mode 100644 arch/loongarch/include/asm/kvm_ipi.h
>  create mode 100644 arch/loongarch/include/asm/kvm_pch_pic.h
>  create mode 100644 arch/loongarch/kvm/intc/eiointc.c
>  create mode 100644 arch/loongarch/kvm/intc/ipi.c
>  create mode 100644 arch/loongarch/kvm/intc/pch_pic.c
>  create mode 100644 arch/loongarch/kvm/irqfd.c
>

