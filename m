Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5F9258ECB
	for <loongarch@lists.linux.dev>; Fri, 21 Nov 2025 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734114; cv=none; b=VHxzm3JEXUZM+OZIwC7cpwFIeAgwS2ZwlPKnR5RLIrBT8ZHSPi+sL4WeL8WaZ7IVNa9AVRitjLtfqu0QxhtHRaB/dUIhwnHe0hyLCnTYx/TjHX6OU6a0DW3Fp8W3kkDglPgBvrNMj8RyuRCtL48CLh/+niOj6k0Jhy7fNG0+4iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734114; c=relaxed/simple;
	bh=wqnctgomW9QlsnpoaSaIOrK9ROL6Od++vjTW5uUShpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B2leGrQaF00lO2bYwj7LusmwsEV2/BL2s6F5AVWVBJiTihLNYSb/Ctl0oqxSsASLvJS+a52R/gDDrN7Pk5hJx/WsnT8N8UPuOFjKq9qdObig6Sz+4M+1jOKAun9QUHI8CTtiyNXb/2CnluhQHqG3upMrLWxQBskpwzFYxQyOECs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAhXq2hB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAhXq2hB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34354C16AAE
	for <loongarch@lists.linux.dev>; Fri, 21 Nov 2025 14:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763734114;
	bh=wqnctgomW9QlsnpoaSaIOrK9ROL6Od++vjTW5uUShpM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YAhXq2hB/gHopjYUT003kWNVybMlECkAaW7rgM16uVBzSwS1bHDq8Jz3xMKkao4Wl
	 xPrUvEe1u8sUY41M6OUjlJLlFTScsofzKJeIhI2Tk0QkMPYnC88yyHA2Y3Nxe+xJyS
	 Vonim2YLerG9nI0HN6gxFRONV3KGZAS7slY/1kJufk8R34EV2QYq5XjYAr0cBo5z8n
	 IcP6QrhsblP1jxCqjJYehtyOaN0eOPzvu0mpTvKAOocglPBg+Ie1LEsZFAxI6o+zGY
	 7Rs4TkmuZ5mJY2QLAKT/TPKb0tEon+/iemadVn+sP70qVrs3ln4z0+ci9D5TChuSG2
	 p4lMyjfDjriWg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b72b495aa81so244790266b.2
        for <loongarch@lists.linux.dev>; Fri, 21 Nov 2025 06:08:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXjZTtnNCaaINxZSjK8t3VflveL+STFFoZxeM9rD68ZMFnuEGFU06XePnhtSdqxi+DuUNM2buhKAoI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyecOPwLUe/QdYBVzKqVFeDWWAPIykTXgs6tg4yco7AxHvWjoP4
	R/9MoG3YxsOzMWg4Gpy64ZO9PcrbxamNVC6MODa06Cxba0oOZBLM1p1Nln1QqVROt5RCGfGTgNg
	EX6lI2rPqzdrwXL9X886SuN+f87B1wHM=
X-Google-Smtp-Source: AGHT+IGvcF/0S9kWajQ67XNIlYN3jQx7syPuoJi7dTDSlFM0uSxAUaOOsj7JhAqIVts2wf9lmd26KLWalOr+tDhwq14=
X-Received: by 2002:a17:907:3cc5:b0:b76:3399:457b with SMTP id
 a640c23a62f3a-b76716d9d5emr240309166b.37.1763734112740; Fri, 21 Nov 2025
 06:08:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120065758.3064368-1-maobibo@loongson.cn>
In-Reply-To: <20251120065758.3064368-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 21 Nov 2025 22:08:22 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4FhRHG+Axsb4KEtiyagepJVKyQ80cLN7TNXdCGAzN-KA@mail.gmail.com>
X-Gm-Features: AWmQ_bkMdZhbipNdZaxn69sj0nHAjeWrzqrP0Iz85WWC9X3fN1V3trAx8IkqlpY
Message-ID: <CAAhV-H4FhRHG+Axsb4KEtiyagepJVKyQ80cLN7TNXdCGAzN-KA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Bibo Mao <maobibo@loongson.cn>, "open list:LOONGARCH" <loongarch@lists.linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

On Thu, Nov 20, 2025 at 2:58=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> This patchset adds timer test case for LoongArch system, it is based
> on common arch_timer test case. And it includes one-shot and period mode
> timer interrupt test, software emulated timer function and time counter
> test.
I test this series on top of 6.18-rc6 with Loongson-3A5000, sometimes
it passes, sometimes I get:
[root@fedora kvm]# ./arch_timer
Random seed: 0x6b8b4567
Guest assert failed,  vcpu 2; stage; 0; iter: 1
=3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
  loongarch/arch_timer.c:79: irq_iter =3D=3D 0
  pid=3D60138 tid=3D60142 errno=3D4 - Interrupted system call
     1  0x00000001200037cf: test_vcpu_run =E4=BA=8E arch_timer.c:70
     2  0x00007ffff2449f27: ?? ??:0
     3  0x00007ffff24c0633: ?? ??:0
  irq_iter =3D 0x1.
  Guest period timer interrupt was not triggered within the specified
  interval, try to increase the error margin by [-e] option.

Is this as expected, or something is wrong?

Hucai

> ---
> v2 ... v3:
>   1. Adjust order about patch 2 and patch 3
>   2. Add test case with alphabetical order
>   3. Merge one-shot and period timer interrupt test case into one
>   4. Only add LoongArch specific modification with common file
>      Makefile.kvm
>
> v1 ... v2:
>   1. Restore PC and PRMD after exception handler
>   2. Split patch 4 into two small patches with period timer test and
>      time counter test
>   3. With time counter test, set time count with 0 when create VM. And
>      verify time count starts from 0 in guest code
> ---
> Bibo Mao (6):
>   KVM: LoongArch: selftests: Add system registers save and restore on
>     exception
>   KVM: LoongArch: selftests: Add basic interfaces
>   KVM: LoongArch: selftests: Add exception handler register interface
>   KVM: LoongArch: selftests: Add timer interrupt test case
>   KVM: LoongArch: selftests: Add SW emulated timer test
>   KVM: LoongArch: selftests: Add time counter test
>
>  tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>  .../kvm/include/loongarch/arch_timer.h        |  84 ++++++++
>  .../kvm/include/loongarch/processor.h         |  81 +++++++-
>  .../selftests/kvm/lib/loongarch/exception.S   |   6 +
>  .../selftests/kvm/lib/loongarch/processor.c   |  47 ++++-
>  .../selftests/kvm/loongarch/arch_timer.c      | 194 ++++++++++++++++++
>  6 files changed, 410 insertions(+), 3 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/loongarch/arch_ti=
mer.h
>  create mode 100644 tools/testing/selftests/kvm/loongarch/arch_timer.c
>
>
> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
> --
> 2.39.3
>
