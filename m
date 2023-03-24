Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B737E
	for <loongarch@lists.linux.dev>; Fri, 24 Mar 2023 06:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C83CC4339B
	for <loongarch@lists.linux.dev>; Fri, 24 Mar 2023 06:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679639534;
	bh=Y5MMaZi0o7RlD8qMkDwmPie+nRo/SORxygZ7ZKxmpI0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D5/+LaiVp4HRPVvkZx3dj6XKOg+VwzAILuk5+BU7bsSdYMm9Jq39Zp2+RtvaUFtKr
	 blE+vRSIzXetAUa48W5nY8OzFY4qCxMV9AeuJEbWXd3ilfbv54rbzVBFf0GxHwopdu
	 8fzU4EaUVGfUGoZ17NVqaEJ6+ItaFov9N6ej4o40clzdbtcQZ5fgaBwjgPzI9FUsni
	 Splvvi/3txwI/uTWxAoUv+qz0ewWRrgR2ysjMV8V3KF8Cj3dCusJESJYCmkbkvx4Pa
	 q87HgI0D9CC/+UlRZbiONLWwm5j3NHMWsfOaBhbwMet7gV2xCxa4TZdAM/mMPUWcZi
	 lDIljoRcoNHeg==
Received: by mail-ed1-f41.google.com with SMTP id b20so3919669edd.1
        for <loongarch@lists.linux.dev>; Thu, 23 Mar 2023 23:32:14 -0700 (PDT)
X-Gm-Message-State: AAQBX9dWZwzE2F8LoxjGVXoPH+avrXnjmyPOZm7ucaUJhqy62iXaEAot
	n8qcXxOLdbo8P9hCbcgGc4LERL2Qncy+F8QQw3E=
X-Google-Smtp-Source: AKy350ZkigswArINqxGmNoRt5tjC+y678vUz2AKeNWNeVyMaJ06ynxPwoTh63yhb8jD6UtkRhQsZYt7hC6zS4w+WzkA=
X-Received: by 2002:a50:cdda:0:b0:4fb:dc5e:6501 with SMTP id
 h26-20020a50cdda000000b004fbdc5e6501mr888360edj.1.1679639532646; Thu, 23 Mar
 2023 23:32:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230324060854.29375-1-lvjianmin@loongson.cn>
In-Reply-To: <20230324060854.29375-1-lvjianmin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 24 Mar 2023 14:32:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7NpUwaf5OCZL=2_GAN_RYGOkPeVAcDiVR5b1M2jdzkDA@mail.gmail.com>
Message-ID: <CAAhV-H7NpUwaf5OCZL=2_GAN_RYGOkPeVAcDiVR5b1M2jdzkDA@mail.gmail.com>
Subject: Re: [PATCH V1 0/5] Fix some issues of irq controllers for
 dual-bridges scenario
To: Jianmin Lv <lvjianmin@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jianmin,

1, Please remove the Change-Id: lines in every patch;
2, Please Cc: stable@vger.kernel.org to make them be backported to
stable branch;
3, Maybe changing the order of Patch3/Patch4 is better.

Huacai

On Fri, Mar 24, 2023 at 2:09=E2=80=AFPM Jianmin Lv <lvjianmin@loongson.cn> =
wrote:
>
> In dual-bridges scenario, some bugs were found for irq
> controllers drivers, so the patch serie is used to fix them.
>
> Jianmin Lv (5):
>   irqchip/loongson-eiointc: Fix returned value on parsing MADT
>   irqchip/loongson-eiointc: Fix incorrect use of acpi_get_vec_parent
>   irqchip/loongson-pch-pic: Fix pch_pic_acpi_init calling
>   irqchip/loongson-eiointc: Fix registration of syscore_ops
>   irqchip/loongson-pch-pic: Fix registration of syscore_ops
>
>  drivers/irqchip/irq-loongson-eiointc.c | 27 ++++++++++++++++----------
>  drivers/irqchip/irq-loongson-pch-pic.c |  6 +++++-
>  2 files changed, 22 insertions(+), 11 deletions(-)
>
> --
> 2.31.1
>
>
