Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69901F9F73
	for <loongarch@lists.linux.dev>; Sun, 17 Aug 2025 03:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755402332; cv=none; b=DW7dTekkjKhhQg9+rpGzd5JL3tyH0kqtSf8zh7SfOKrIWkxLewMmixvjS2mvaS/lgwiu2vVXNipoeeXJJSFhJMhUmOCAnkKs9DEOLEQED31JvY70IE/XqPa1AebRUKatzTRNXt6C9uw+/q/K2UxnTNcTICleI1xTfIddLX0+PJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755402332; c=relaxed/simple;
	bh=0xTwLjVmn1pv+BiHVbOnx4WYaKKwm9hpP0y0rAIfPWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLRgYMtUReWQa8ZJTSRMA/YJpq2vtgjT3AqmXFFwxqBSh083u/h63LJO55s9U3I7xwXLxF0qm7FOdDYxhqrXPVGlUFadvg5Y5dl0VA7WBafWnAjL3C25NGnQehbw0PbYrDRe/vf3UMiqENKpcGbXrTXkVTBdBYzf7I/LmbtsLak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBIg5Jjh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBIg5Jjh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C33C4CEEB
	for <loongarch@lists.linux.dev>; Sun, 17 Aug 2025 03:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755402331;
	bh=0xTwLjVmn1pv+BiHVbOnx4WYaKKwm9hpP0y0rAIfPWE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BBIg5JjhIcFmc8Hq0kMax9VlfspQxo8SAOK1Sh7QhbsYqhx/sGdB07egcP6x4KUWj
	 Yoa7EswTSYkYOQjsyH9d4+5xsVWjjRqF/dvE77W5jXQv3DzIMy57GzxYtEI4BgEXED
	 VlQSuXSTIoum1MnDQ8yPxHQ4qubfxdtrfXcIcdzAN1tXiyeDQ4iAjlTCRGXn4oym6U
	 HgFo55afMivN5QiaxW6R6oDJlP0dzpH+8iJEczBkfynQ2bVXfL6bKrd0RXeiuyC+W5
	 urRKeXdu6P0CPZ73yHm0YbJpquR+p+4eX4mYtO9ysjrWUucOrQxI2LfK+p2OLyvORg
	 mPz94J94OkxWA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6188b5b11b2so3878896a12.0
        for <loongarch@lists.linux.dev>; Sat, 16 Aug 2025 20:45:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQqJYgbYZWOdteoq4WtTdDsrcxFG65GwQHNocpAOc8v/RSMNwRH7SadaR2j25mKLZpkPUoCygnCWU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6+Gf+ropcHpF4i1fmxo4Oc7AUnm1HLINxGntWFd5lz4IkifoR
	BPZGxe7f1xuPxwjhsu7poRWmkxvWpeehJ4PKGalupTzHmA9ixA2Ox7QT1yNp5kJZ9MQZMRcxXDK
	SFcTnsvOf6yy+NgAdgKRSL1zzDUsQF2Y=
X-Google-Smtp-Source: AGHT+IHU2F1OuHP2+TNA3BmJ4OGUQ0ScEw4NdOAnevoKv6AnvesNZw7f40m4RiAo5kKMzaMnqE4TJNhtY1cLVMGR4Qc=
X-Received: by 2002:a05:6402:90d:b0:604:e602:779a with SMTP id
 4fb4d7f45d1cf-619bf1fafa1mr3806554a12.28.1755402329800; Sat, 16 Aug 2025
 20:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815022621.508174-1-maobibo@loongson.cn>
In-Reply-To: <20250815022621.508174-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 17 Aug 2025 11:45:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Sem=X7KUiO2vQgT_5KX-v4Xv3yB+UUrWHL4tmRnJkGQ@mail.gmail.com>
X-Gm-Features: Ac12FXz8IKCWjK4TiPlQZ7UQkp-9Hmk1V7p2XaSuhPc1AliPMGuF1yhaOsApdh8
Message-ID: <CAAhV-H4Sem=X7KUiO2vQgT_5KX-v4Xv3yB+UUrWHL4tmRnJkGQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] LoongArch: KVM: Small enhancements about IPI and LBT
To: Bibo Mao <maobibo@loongson.cn>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, Xianglai Li <lixianglai@loongson.cn>, kvm@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patch-1 and Patch-4 are applied for loongarch-fixes.

Huacai

On Fri, Aug 15, 2025 at 10:26=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wro=
te:
>
> Thre are some small enhancement about IPI emulation and LBT enabling in
> LoongArch KVM. With IPI, it supports sending command to vCPU itself. And
> with LBT it adds flag checking int function kvm_own_lbt() and make it
> robust.
>
> ---
> v2 ... v3:
>   1. Fix stack protector issue in send_ipi_data()
>
> v1 ... v2:
>   1. Add sending IPI command to vCPU itself
>   2. Avoid duplicated LBT enabling in kvm_own_lbt()
> ---
> Bibo Mao (4):
>   LoongArch: KVM: Fix stack protector issue in send_ipi_data()
>   LoongArch: KVM: Access mailbox directly in mail_send()
>   LoongArch: KVM: Add implementation with IOCSR_IPI_SET
>   LoongArch: KVM: Make function kvm_own_lbt() robust
>
>  arch/loongarch/kvm/intc/ipi.c | 57 ++++++++++++++++++++++-------------
>  arch/loongarch/kvm/vcpu.c     |  8 +++--
>  2 files changed, 41 insertions(+), 24 deletions(-)
>
>
> base-commit: dfc0f6373094dd88e1eaf76c44f2ff01b65db851
> --
> 2.39.3
>
