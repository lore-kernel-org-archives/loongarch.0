Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6705F221263
	for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556460; cv=none; b=hB+lp4putkSxWe9gmSfiD//36dxi/YWz+WZ6WXT9Ro+MPJhl/Q6/hU5AF/qkHIXHMzudIm0nl8qCvo5RoGTX/+K4bHlfDku0EuYaTf9Hfa8kcgiHJjy/HBXVQ3VBzccY1LHMv2qp9ERGgtaQiwVy8DKmrx8ZSjEJuwQ+jRYmXuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556460; c=relaxed/simple;
	bh=4Yait4aMo7R5A1axnUR1iRVdVYOZN6Z+sj3q9FLyCt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCBbv/EBb1vPux4Ah6hWf78EzElqTzo2oHYEHR2Y+W06rB3RZINYSwn2oC4o/fB3+4cOr18iQEy8wvlb7Q67XU0lGpgxIjnNfGr3kdbnHFO+H8V52NTrWJNSenPOVLGqNfVGt3m1Gj0U24uw5hSvNl6mzkOK0PwxZiqeig64XAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ac4xbYVR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ac4xbYVR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098C7C4CEF3
	for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 11:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749556460;
	bh=4Yait4aMo7R5A1axnUR1iRVdVYOZN6Z+sj3q9FLyCt8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ac4xbYVRfI82esY1ItQ7JqZRl4oPtUi/ftDy+7n8wiiyydaBB+Td37nlPC7y7urT/
	 ZB0558ALOFZT1oefU47kq8rvU4lfFh8w5h9yYzbgj1+TetGjf4HWE6GJOOGJbeFU6x
	 i2xWRiTdYDfjKt5t1BYOKzVdXUItMxj/86qcYKG/jBByB56koyV9FQcS3LGBISucY9
	 ELCi2Bi2rOQE/pgVr2/fVHK7vlUbfx1m84MEYkB95sYYabvLLFpY6mtbFySKF8TFVT
	 tHd8Jr1xcT3pWdZU1sclm/bne7SPs4w3ShnUPI5xz06FzFT4yobDjqL4+ME69/jZdc
	 RJd4e7XS2e7yg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso5251862a12.2
        for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 04:54:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3GrkQ+hRF1kYp7Dn5fbfaa6ZH3fDJgNg7yWyab2GHgAfuL6Vs+j1P4P3lYcaiQiNR+xMxkl9RO3A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBjcdWLq7rId2jvwxAdJ2otSEQSqNMsmwFl/iY88MBL9iOsaiV
	7hwG887RAn9z2ICxkYT7hcVitTtJ95PlmFPLoWi4gH0Sf6Ws1FbxErqOFyz2bN2B2stYoughUlT
	lvIxYK9JwhBaFMeLtRLnAqLYubCyWLPk=
X-Google-Smtp-Source: AGHT+IGvNRJJuSwa/zI6M5nGCQWEkP5Tqaw7VyqLhE5OjxyGtDXZzw1MQNm89CejDAXXPf9AWT1/HB2voJ/fMmd83NU=
X-Received: by 2002:a05:6402:5109:b0:603:5a23:2997 with SMTP id
 4fb4d7f45d1cf-6082d9b36afmr2124005a12.17.1749556458441; Tue, 10 Jun 2025
 04:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250610114252.21077-1-zhangtianyang@loongson.cn>
In-Reply-To: <20250610114252.21077-1-zhangtianyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 10 Jun 2025 19:54:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5XB7sVf0UoUmXHDeTXA8tncJhV2LexLgc-Z1Hebsijtw@mail.gmail.com>
X-Gm-Features: AX0GCFuuWC59s_ij5SZgZ2sFeRpeQtZYtBIN7Y-98gkb49cCnnIryE5bln1ZHwg
Message-ID: <CAAhV-H5XB7sVf0UoUmXHDeTXA8tncJhV2LexLgc-Z1Hebsijtw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Loongarch irq-redirect supprot
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev, 
	tglx@linutronix.de, jiaxun.yang@flygoat.com, peterz@infradead.org, 
	wangliupu@loongson.cn, lvjianmin@loongson.cn, maobibo@loongson.cn, 
	siyanteng@cqsoftware.com.cn, gaosong@loongson.cn, yangtiezhu@loongson.cn, 
	loongarch@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Super User <root@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tianyang,

Have you received my comments in V3?
https://lore.kernel.org/loongarch/20250523101833.17940-1-zhangtianyang@loon=
gson.cn/T/#m2883f379ce7eb663f3f3eb4736bf9b071c7fd8ab

Huacai

On Tue, Jun 10, 2025 at 7:43=E2=80=AFPM Tianyang Zhang
<zhangtianyang@loongson.cn> wrote:
>
> From: Super User <root@localhost.localdomain>
>
> This series of patches introduces support for interrupt-redirect
> controllers, and this hardware feature will be supported on 3C6000
> for the first time
>
> change log:
>         v0->v1:
>         1.Rename the model names in the document.
>         2.Adjust the code format.
>         3.Remove architecture - specific prefixes.
>         4.Refactor the initialization logic, and IR driver no longer set =
AVEC_ENABLE.
>         5.Enhance compatibility under certain configurations.
>
>         v1->v2:
>         1.Fixed an erroneous enabling issue.
>
>         v2->v3
>         1.Replace smp_call with address mapping to access registers
>         2.Fix some code style issues
>
>         v3->v4
>         1.Provide reasonable comments on the modifications made to IRQ_SE=
T_MASK_OK_DONE
>         2.Replace meaningless empty functions with parent_mask/unmask/ack
>         3.Added and indeed released resources
>         4.Added judgment for data structure initialization completion to =
avoid duplicate creation during cpuhotplug
>         5.Fixed the code style and some unnecessary troubles
>
> Tianyang Zhang (2):
>   Docs/LoongArch: Add Advanced Extended-Redirect IRQ model description
>   irq/irq-loongarch-ir:Add Redirect irqchip support
>
>  .../arch/loongarch/irq-chip-model.rst         |  38 ++
>  .../zh_CN/arch/loongarch/irq-chip-model.rst   |  37 ++
>  arch/loongarch/include/asm/cpu-features.h     |   1 +
>  arch/loongarch/include/asm/cpu.h              |   2 +
>  arch/loongarch/include/asm/loongarch.h        |   6 +
>  arch/loongarch/kernel/cpu-probe.c             |   2 +
>  drivers/irqchip/Makefile                      |   2 +-
>  drivers/irqchip/irq-loongarch-avec.c          |  25 +-
>  drivers/irqchip/irq-loongarch-ir.c            | 562 ++++++++++++++++++
>  drivers/irqchip/irq-loongson.h                |  12 +
>  include/linux/cpuhotplug.h                    |   1 +
>  11 files changed, 674 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/irqchip/irq-loongarch-ir.c
>
> --
> 2.41.0
>
