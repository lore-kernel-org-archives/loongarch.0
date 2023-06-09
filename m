Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8268A44
	for <loongarch@lists.linux.dev>; Fri,  9 Jun 2023 02:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9575EC433A0
	for <loongarch@lists.linux.dev>; Fri,  9 Jun 2023 02:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686276267;
	bh=R8OkAj6OIkdcUXTCmDhI7Jf2XQIKaCplXivoSkeLxc8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eoCa+EplOc9QFhELnU3lDHZgCBC4dl6iAIYucHhu4MZ0w94r160zwlDPygePm23Z3
	 CfuN5VaStVkuaKOsWVbi6/iwNxzWWNSQO0fJvL3+o+/u1KshjV/zgdIFMTj0/FJYDB
	 +9zohW0Hyl9iW2BEfi98hPRunCujDIVBzMXVS519Tigk0kBeuQtMaDWh9QClFIG5N8
	 7Gxv3K07Z19e24Hly8Me7mYYMHxVMHsquA60NdB+upL+jwxSfi/nsel1OVcyPHoKM0
	 EZNdNW6LkO43t1SwuCEvkKZ/eLNDL5bB4ICzmLyJfi+F7QOJR1yWoKui0G+BBXvLFr
	 DWtAHRai9k8CA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-97881a996a0so241744166b.0
        for <loongarch@lists.linux.dev>; Thu, 08 Jun 2023 19:04:27 -0700 (PDT)
X-Gm-Message-State: AC+VfDxDEneOjv5FzxpTyvBJ8LeuzT6Cjz4Jt/zh7ooG6l2GNmoJsTpH
	VUgTwCTjIPW0XwcwmGNFxlAToz9pDmbHvv1JDBw=
X-Google-Smtp-Source: ACHHUZ6ruALU7GHn4PiFGkCL/kfW8XviX1EpOnZUIyrYeeP7EGXmHWTPIQh/1nrOTXfq/5zb3NIyawAHwi2Xjneh91c=
X-Received: by 2002:a17:907:c15:b0:94e:48ac:9a51 with SMTP id
 ga21-20020a1709070c1500b0094e48ac9a51mr343743ejc.4.1686276265775; Thu, 08 Jun
 2023 19:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230608130157.5871-1-zhangqing@loongson.cn>
In-Reply-To: <20230608130157.5871-1-zhangqing@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 9 Jun 2023 10:04:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7yLgM7WAnubjkBx27E7UUTpMC+x93y=t6YkcEWBafFGQ@mail.gmail.com>
Message-ID: <CAAhV-H7yLgM7WAnubjkBx27E7UUTpMC+x93y=t6YkcEWBafFGQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Avoid uninitialized alignment_mask
To: Qing Zhang <zhangqing@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Colin King <colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued, thanks.

Huacai

On Thu, Jun 8, 2023 at 9:02=E2=80=AFPM Qing Zhang <zhangqing@loongson.cn> w=
rote:
>
> The hardware monitoring points for instruction fetching and
> load/store operations need to align 4 bytes or 1/2/4/8 bytes respectively=
.
>
> Reported-by: Colin King <colin.i.king@gmail.com>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>  arch/loongarch/kernel/hw_breakpoint.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kerne=
l/hw_breakpoint.c
> index 2406c95b34cc..021b59c248fa 100644
> --- a/arch/loongarch/kernel/hw_breakpoint.c
> +++ b/arch/loongarch/kernel/hw_breakpoint.c
> @@ -396,6 +396,8 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
>
>         if (hw->ctrl.type !=3D LOONGARCH_BREAKPOINT_EXECUTE)
>                 alignment_mask =3D 0x7;
> +       else
> +               alignment_mask =3D 0x3;
>         offset =3D hw->address & alignment_mask;
>
>         hw->address &=3D ~alignment_mask;
> --
> 2.20.1
>
>
