Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605131EA9A
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 08:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E84C433C8
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 08:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690877548;
	bh=S4ClZ9wZytkvBMl0VCI/3sRI2qL/K3gdkOl/wEs//Fw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MeAvPvPQnx59icnMaHIUNR06QOyOQb49RChUxDxFPR9p/vHVAfjLArG3KaSJ/S3ux
	 vu+4TeigcGcKRs4MUEj4lByU4HJbT0FSCXdy/Jxx4CA/rvU9HgJynakXBXYVndZe8V
	 B89RahJ+7Yr+wvCraukvBUV5fHtxmrp5RmDljHrlegiUhSOi8MB9bD0zZBhTgtukzc
	 lPJn10x87HB2Nno7wLajgzW3SJcVaR9FspMHagLndrIOm5NlPU+v/l5DCWhsUdrpOn
	 dSIFVBWdwqOzFYhyFGNS8kcLDMA2s6VaGoDCoH02EgPpEz6h3YJo7vgyo9cRKnf1ON
	 vB1740SAZldoQ==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51e429e1eabso7402681a12.2
        for <loongarch@lists.linux.dev>; Tue, 01 Aug 2023 01:12:28 -0700 (PDT)
X-Gm-Message-State: ABy/qLZDh021TSOnRQvE8+gGDjq4O1bOuSd/+A9UT3GOdKrE/LQbKfB1
	hzwpbh7O+qVQhAXmcib1HKATw44P8xCmVz9fKFA=
X-Google-Smtp-Source: APBJJlFPyt0iU2cDmNKxrPc1kzDkaWeQg8wI4ZBK8X4hl+wU5aX4LmR3ugB1KoQ8cYkzquTsPv4TlGk1aUZxvuEvmDs=
X-Received: by 2002:aa7:cd0a:0:b0:522:bbc1:a343 with SMTP id
 b10-20020aa7cd0a000000b00522bbc1a343mr1760339edw.6.1690877546479; Tue, 01 Aug
 2023 01:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230614083326.9822-1-luojianhong@cdjrlc.com> <a69170cb55cfc73e378b40ccf1d9c16f@208suo.com>
In-Reply-To: <a69170cb55cfc73e378b40ccf1d9c16f@208suo.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 1 Aug 2023 16:12:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7QmrJGn6=Me64bE9t-tq+Gr0jyNc4jH6fshNmhCY8AOQ@mail.gmail.com>
Message-ID: <CAAhV-H7QmrJGn6=Me64bE9t-tq+Gr0jyNc4jH6fshNmhCY8AOQ@mail.gmail.com>
Subject: Re: [PATCH] soc: loongson: Remove unneeded semicolon from loongson2_soc_die_attr()
To: baomingtong001@208suo.com
Cc: zhuyinbo@loongson.cn, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Mingtong,

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
And please resend this patch, cc Arnd and soc@kernel.org, because that
is the most appropriate list for this patch.

Huacai

On Wed, Jun 14, 2023 at 4:42=E2=80=AFPM <baomingtong001@208suo.com> wrote:
>
> ./drivers/soc/loongson/loongson2_guts.c:73:2-3: Unneeded semicolon
>
> Signed-off-by: Mingtong Bao <baomingtong001@208suo.com>
> ---
>   drivers/soc/loongson/loongson2_guts.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/loongson/loongson2_guts.c
> b/drivers/soc/loongson/loongson2_guts.c
> index bace4bc8e03b..afa559396013 100644
> --- a/drivers/soc/loongson/loongson2_guts.c
> +++ b/drivers/soc/loongson/loongson2_guts.c
> @@ -70,7 +70,7 @@ static const struct loongson2_soc_die_attr
> *loongson2_soc_die_match(
>           if (matches->svr =3D=3D (svr & matches->mask))
>               return matches;
>           matches++;
> -    };
> +    }
>
>       return NULL;
>   }
>
