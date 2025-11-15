Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03BB1ACDFD
	for <loongarch@lists.linux.dev>; Sat, 15 Nov 2025 03:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763178202; cv=none; b=GgQBFluJyu2Qh/6LtNqUarpvpAjqOGZmCghXx/D/WFI9/ta9Sg5GV1zP1LAsps8Rb5TzQJvIDtzUjyPN+sy6hpUvwXK8XPBo2dE5xZWMHk3XKnH5R9X+MuQAKpuUtqMQ1DrgvbQq3aInY0UNkqF4hBgpsxXkUKO7NG9Eb1KqIH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763178202; c=relaxed/simple;
	bh=0yAQqu9bySJFd0xkhj6bX2uJ+H6RWvo5fIeAxVQ9VqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiq21E0KxM1in5qbAYMvNVWgI0NbPg/5XkFh8fbH0+bVQt2Izux7BORkVz9qYG0e8Y1H7nmBtTv4gc9aTkYbJqlese64oO/pyP3Ckxt0DXLi/2CGcKNw9c8bi09yWW7rmvzHDiG/+TrKhuHMlPipZtESasEJBIh1emGdmImvQW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMvAIBeb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMvAIBeb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F179C116B1
	for <loongarch@lists.linux.dev>; Sat, 15 Nov 2025 03:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763178202;
	bh=0yAQqu9bySJFd0xkhj6bX2uJ+H6RWvo5fIeAxVQ9VqM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fMvAIBebgijpoqlDV/dQOx3tM1LK6FOSehbQyjw/NcQ3quM9dRAZ2OG2pOL4FVmwZ
	 24mOTBDlyDNaj37BPuxnHQQThjc5dK+ANWSd74Y4uQ+w5QfilpFhhroxPCWvNFTJEm
	 pP9ZzL/BgG9KkFbi8auujDgCbLjZOydmooDDt2zmxngxC8IDC7JPjpjBTwOXGAOCtc
	 A/Amv7qWzS3PPhWM4An1uzOE9ubvbbutORJxcKJ8BQJcjqmKEC5D+Lt6orqkFSdWVe
	 xQWTI+8NpLKlRhtTXqZojtVKbOan+L/Rqa1l2h/T2moDEzrVP8XsJXgpS7sZ2PyGbl
	 KXsSglb45g98A==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so403101566b.3
        for <loongarch@lists.linux.dev>; Fri, 14 Nov 2025 19:43:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXykulqH/P8I+CQ29AQutM34g8//e1VX15vV2dziR3OptvV+P1IKTDjxpR3GlchAhNBkefBYZJCzT4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyFh8BU2K9Jo1s8VRRGMI0m8Cf0dktVNQwwIaHb1c1E5Cx+duy
	JfbnjR1p+Spjr/ZxgwhW06Qy+9iEZuFOqB1Iu2FIwiJJ4bAtEJwyE/UarktBIce5URw2tO/yNE+
	kbJeNE3cdZE//QVwSMhkmPPIRdSmrJNA=
X-Google-Smtp-Source: AGHT+IEuj0++N4GmxwxCyzCk/7ufD05tKf89jPs6Txj8UozCXQFV46M5P8nSLbwbg+LbuBunhMubbMYq29f+xJORQIU=
X-Received: by 2002:a17:906:581b:b0:b73:6931:558a with SMTP id
 a640c23a62f3a-b736931568emr390903366b.18.1763178201036; Fri, 14 Nov 2025
 19:43:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251104113700.1561752-1-maobibo@loongson.cn>
In-Reply-To: <20251104113700.1561752-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 15 Nov 2025 11:43:09 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6kU=6JtEoy3arisuo7RvVBHTn_g6TP7kGuz7AT2pRnQQ@mail.gmail.com>
X-Gm-Features: AWmQ_bne_bnQ1MX_aK6L6PAWnnYopTrqDR2KYqRIKDky8Cpc1wKuOlHuSG0m4GA
Message-ID: <CAAhV-H6kU=6JtEoy3arisuo7RvVBHTn_g6TP7kGuz7AT2pRnQQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] KVM: LoongArch: selftests: Add timer test case
To: Bibo Mao <maobibo@loongson.cn>, "open list:LOONGARCH" <loongarch@lists.linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

I'm very confused with this series.
1. The cover letter doesn't appear in the maillist.
2. Patch-6 is missed in the thread.
3. The one-shot and periodic test splitting is a little strange,
because you put some common parts in the on-shot test, maybe you can
consider merge these two.

Huacai

On Tue, Nov 4, 2025 at 7:37=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrote=
:
>
> This patchset adds timer test case for LoongArch system, it is based
> on common arch_timer test case. And it includes one-shot and period mode
> timer interrupt test, software emulated timer function and time counter
> test.
> ---
> v1 ... v2:
>   1. Restore PC and PRMD after exception handler.
>   2. Split patch 4 into two small patches with period timer test and
>      time counter test.
>   3. With time counter test, set time count with 0 when create VM. And
>      verify time count starts from 0 in guest code.
> ---
> Bibo Mao (7):
>   KVM: LoongArch: selftests: Add system registers save and restore on
>     exception
>   KVM: LoongArch: selftests: Add exception handler register interface
>   KVM: LoongArch: selftests: Add basic interfaces
>   KVM: LoongArch: selftests: Add timer test case with one-shot mode
>   KVM: LoongArch: selftests: Add period mode timer test
>   KVM: LoongArch: selftests: Add SW emulated timer test
>   KVM: LoongArch: selftests: Add time counter test
>
>  tools/testing/selftests/kvm/Makefile.kvm      |  10 +-
>  .../kvm/include/loongarch/arch_timer.h        |  84 ++++++++
>  .../kvm/include/loongarch/processor.h         |  81 +++++++-
>  .../selftests/kvm/lib/loongarch/exception.S   |   6 +
>  .../selftests/kvm/lib/loongarch/processor.c   |  47 ++++-
>  .../selftests/kvm/loongarch/arch_timer.c      | 195 ++++++++++++++++++
>  6 files changed, 417 insertions(+), 6 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/loongarch/arch_ti=
mer.h
>  create mode 100644 tools/testing/selftests/kvm/loongarch/arch_timer.c
>
>
> base-commit: ec0b62ccc986c06552c57f54116171cfd186ef92
> --
> 2.39.3
>
