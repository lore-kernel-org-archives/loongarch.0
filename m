Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE76553BA
	for <loongarch@lists.linux.dev>; Thu, 15 Jun 2023 09:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B636C43397
	for <loongarch@lists.linux.dev>; Thu, 15 Jun 2023 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686821260;
	bh=d7FUc2x2QBBGY3xLHCy5+cj0h3y5APGEcxelKil53c4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WA4p9evU3in3wUrH6riYZXCdnDqJW37VIO2izCWinczXk/CwFfH+PUoBfh5dpXAfy
	 Utx3K/4zHr902MiD85m3wwmB+KOojS2Ty8WfWO2B2u1fZeV+75eRvvBL7N+hBC4S5x
	 i1K4FA1JKEgfFWlKn9XGy3DY8EV4zRpyla8oR+mr8wwjNa+Xr6+9ZLCTeDR1m7mhZQ
	 1pLuBivK73dyYKkYTUMR5ux+VP6zklmuLW6cPpk+ELHTeOZFbZoW5LKabqBTf/vLqZ
	 X5ZwPdDvpCwwBCa80p5rEZqU0gBpKVHVU1OQUvxZrXNF3yZTMP+MiYX74GijQUZ3IF
	 Vft9AK2HKoDSg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b4491aaf4dso1625121fa.1
        for <loongarch@lists.linux.dev>; Thu, 15 Jun 2023 02:27:40 -0700 (PDT)
X-Gm-Message-State: AC+VfDzVaiTDVFCJltXHXM1fV84N+3VCwi+M3U2aqA3HStfNGskFCOAt
	nWpkN0by/n4zQxytAPNru32oh38tknVB4g6N8cI=
X-Google-Smtp-Source: ACHHUZ5mLbKpcpBulqvD9pFSkFwacuN/I6efRQqkvHs5q2S+hlNPdAR9kXpzoBMs/6y+8Bbk2RvIcTUcMU5Y04maMdE=
X-Received: by 2002:a2e:804b:0:b0:2b0:489e:c457 with SMTP id
 p11-20020a2e804b000000b002b0489ec457mr8298699ljg.39.1686821257836; Thu, 15
 Jun 2023 02:27:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230609090518.2130926-1-zhaotianrui@loongson.cn> <20230609090518.2130926-31-zhaotianrui@loongson.cn>
In-Reply-To: <20230609090518.2130926-31-zhaotianrui@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 15 Jun 2023 17:27:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6ddLNgMocmE7UtpLmrqsCUYYbwxqhFJ6OOGCUCLTXAhg@mail.gmail.com>
Message-ID: <CAAhV-H6ddLNgMocmE7UtpLmrqsCUYYbwxqhFJ6OOGCUCLTXAhg@mail.gmail.com>
Subject: Re: [PATCH v13 30/30] LoongArch: KVM: Add maintainers for LoongArch KVM
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, WANG Xuerui <kernel@xen0n.name>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev, 
	Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>, 
	Alex Deucher <alexander.deucher@amd.com>, Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn, 
	Xi Ruoyao <xry111@xry111.site>, tangyouling@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tianrui,

On Fri, Jun 9, 2023 at 5:06=E2=80=AFPM Tianrui Zhao <zhaotianrui@loongson.c=
n> wrote:
>
> Add maintainers for LoongArch KVM.
>
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 27ef11624748..c2fbfd6ad4e5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11357,6 +11357,18 @@ F:     include/kvm/arm_*
>  F:     tools/testing/selftests/kvm/*/aarch64/
>  F:     tools/testing/selftests/kvm/aarch64/
>
> +KERNEL VIRTUAL MACHINE FOR LOONGARCH (KVM/LoongArch)
> +M:     Tianrui Zhao <zhaotianrui@loongson.cn>
> +M:     Bibo Mao <maobibo@loongson.cn>
> +M:     Huacai Chen <chenhuacai@kernel.org>
> +L:     kvm@vger.kernel.org
> +L:     loongarch@lists.linux.dev
> +S:     Maintained
> +T:     git https://github.com/loongson/linux-loongarch-kvm
I'm not sure, but I think this should be a tree which can be used to
send PR for upstream maintainers. If no other selection, we should use
git git://git.kernel.org/pub/scm/virt/kvm/kvm.git

Huacai
> +F:     arch/loongarch/include/asm/kvm*
> +F:     arch/loongarch/include/uapi/asm/kvm*
> +F:     arch/loongarch/kvm/
> +
>  KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)
>  M:     Huacai Chen <chenhuacai@kernel.org>
>  M:     Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> --
> 2.39.1
>
>
