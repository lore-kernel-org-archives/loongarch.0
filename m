Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D3817CE
	for <loongarch@lists.linux.dev>; Tue, 16 May 2023 02:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D71C4339B
	for <loongarch@lists.linux.dev>; Tue, 16 May 2023 02:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684202604;
	bh=ycv+VEOGv9cbrchvl8jntmN5FDbyqDgaTPIMmjcdJ2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RfL+wE+ijp/vwxuUi8Oeoc58fXRtexJKKEwdzdM3jh8pj6jgmWY5R1kijJkO7rprd
	 IFIs2MHseWek6U3oemMJvtq2nSSr6OO/F85mia6BQAFi+45SCUa7SePdsilXTUm1eP
	 A42akmSQh1XZl4OFiXKSnmD6YhlBejLzUkazlXga0g4qsfAbiA0jvkWQFl+Y1uD7y3
	 2GEuJJ0AutAoO3RPBZKJgwijad6mWMlzkXJjBVkfN1L8bb7LXvVUNMDNdu8RDLulwR
	 W/u0cBu5Br8vFJkZ5Q2+NKEjtUDEhQVH6QRN9pjPUqe/1fmbTdjIMhbVJ2swcp+ESF
	 3fHzTB4ntWCaQ==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-96ab81aa68dso761308166b.3
        for <loongarch@lists.linux.dev>; Mon, 15 May 2023 19:03:24 -0700 (PDT)
X-Gm-Message-State: AC+VfDwWkXNzMr4yJoBqJr8OyJyB+vBuyeCaPLix5o6HfZa+zrxtqnun
	EAUZWVbzEbE1VpntWubqvRJYMDDNdufkW8ko73E=
X-Google-Smtp-Source: ACHHUZ5gTNUGfE3MSgIgdGoB5vnNs4BSJ48K7k49j26N3jMzpe/R2bH1dkkCHE3cFTF/AI5F8XyrKnjyB2clTp2SkcY=
X-Received: by 2002:a17:907:2685:b0:94f:3bf7:dacf with SMTP id
 bn5-20020a170907268500b0094f3bf7dacfmr30748735ejc.71.1684202602654; Mon, 15
 May 2023 19:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAhV-H48t8tDmWoZOSqx06HwwXKY1CR=X+hi0o_ok6gSu6dQSg@mail.gmail.com>
 <CY5PR12MB64558068B314942BA1B2ED2BC67B9@CY5PR12MB6455.namprd12.prod.outlook.com>
In-Reply-To: <CY5PR12MB64558068B314942BA1B2ED2BC67B9@CY5PR12MB6455.namprd12.prod.outlook.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 16 May 2023 10:03:11 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6ep_A-7568zE2ggQUXpyhH=zS90TsHP8X0gn5s8LZ8iQ@mail.gmail.com>
Message-ID: <CAAhV-H6ep_A-7568zE2ggQUXpyhH=zS90TsHP8X0gn5s8LZ8iQ@mail.gmail.com>
Subject: Re: [PATCH v2] loongarch: fix debugfs_create_dir error checking
To: mirimmad@outlook.com
Cc: ivan.orlov0322@gmail.com, kernel@xen0n.name, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, mirimmad17@gmail.com, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued, thanks.

Huacai

On Sun, May 14, 2023 at 2:44=E2=80=AFPM <mirimmad@outlook.com> wrote:
>
> From: Immad Mir <mirimmad17@gmail.com>
>
> The debugfs_create_dir returns ERR_PTR incase of an error and the
> correct way of checking it by using the IS_ERR_OR_NULL inline function, a=
nd
> not the simple null comparision. This patch fixes this.
>
> Suggested-By: Ivan Orlov <ivan.orlov0322@gmail.com>
> Signed-off-by: Immad Mir <mirimmad17@gmail.com>
> ---
>  arch/loongarch/kernel/unaligned.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/unaligned.c b/arch/loongarch/kernel/un=
aligned.c
> index bdff825d2..85fae3d2d 100644
> --- a/arch/loongarch/kernel/unaligned.c
> +++ b/arch/loongarch/kernel/unaligned.c
> @@ -485,7 +485,7 @@ static int __init debugfs_unaligned(void)
>         struct dentry *d;
>
>         d =3D debugfs_create_dir("loongarch", NULL);
> -       if (!d)
> +       if (IS_ERR_OR_NULL(d))
>                 return -ENOMEM;
>
>         debugfs_create_u32("unaligned_instructions_user",
> --
> 2.40.0
>
