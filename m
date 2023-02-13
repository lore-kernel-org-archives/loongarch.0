Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2934E1FA8
	for <loongarch@lists.linux.dev>; Mon, 13 Feb 2023 06:43:57 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id d40so10198185eda.8
        for <loongarch@lists.linux.dev>; Sun, 12 Feb 2023 22:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rupOtt5ylLjo3fhbHlzPJE20iu9FpqDjZ+/K/Redjx8=;
        b=RcloBeKyGiN5jhXwNZnYJooc9NETmlpmcBG0PCwG//qfKJxVGf0biHLkDx5aShb7DL
         /UB3zX5Ab+pa7uY69n/QM/4BccnvWZk7aVRdg8NS5uRWfVQ5zdVhcqH4FGpacZWKLcur
         4oxgQMtFOEEQv2WA4o2f/9vKx2VB7ZKkXhST8lhNCF91mRQ8miAt3ruYLDQ1fi16QmTq
         VTevFJpeL6yrO2nJYmwu39TwBlO0A9/wnAQjjfzH7uUskS3JEje+pbYbXnOsBj3lM9k1
         /iKxtiyK4QCurN3hjyVa4uBXHI9crjgOo0d1Be/nxe2Ay+XsTSVvUvJqKhSziot9tkWB
         sdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rupOtt5ylLjo3fhbHlzPJE20iu9FpqDjZ+/K/Redjx8=;
        b=AVqj+FBHUp1qICUM/lqWAJgW/h1EBVSs5UNiqzj2YCuyTxn/CO+IEnMaGxzwSTTnsM
         +YUnVw8iE56/FYTl96IrbsOKhomrVG/7O86m5i1gqFb0pMOdQbF1zIU9n/ex3o1pXzJQ
         XmvvS3TJ/etn46IScwJRr2h6BbfIqQq6yMmCmvyC+fBuz6Jh8AoDSl4eA6JJD1+bCZv/
         7YnPY3lAAGxvlrn/SebrFXd1C4igq6WhiRNTcPfKY2Z3nNdlfDagHTzbj7zTxIzT2Msa
         WtphsJ8q8TjnWsVOQYCsUYliN0fGrdRRSfBHqQJ8ktQuqViGFtFT0MiOwHJKv8bjeCLo
         LXeA==
X-Gm-Message-State: AO0yUKXkAVIgleDFrCovR9POjDbsQTYDgMO1EVaxbpENQWs0L2+8PZlc
	LPWdUDNMscstT6+CpZA7VJr4MDP9Yz437gLoNE75NcVcFRg=
X-Google-Smtp-Source: AK7set/hbslv9tB2aTA07MPLpW6tzHMxN4NvFICuLuZaCEMs+04VVTiV26HkiYJEQ7IMxrN4pUx4eXnJfGdqT06vU0g=
X-Received: by 2002:a50:f61b:0:b0:4ac:b528:5728 with SMTP id
 c27-20020a50f61b000000b004acb5285728mr2940770edn.2.1676270635423; Sun, 12 Feb
 2023 22:43:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230211024156.3530526-1-zhoubinbin@loongson.cn> <87lel3kssq.wl-maz@kernel.org>
In-Reply-To: <87lel3kssq.wl-maz@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 13 Feb 2023 14:43:40 +0800
Message-ID: <CAMpQs4KwCgUA24apw=wmN=k7n+ERiip8gG9-8kirCQ+-HDP1Jg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/loongson-eiointc: Add DT init support
To: Marc Zyngier <maz@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jianmin Lv <lvjianmin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 12, 2023 at 7:49 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 11 Feb 2023 02:41:56 +0000,
> Binbin Zhou <zhoubinbin@loongson.cn> wrote:
> >
> > Add DT support for EIOINTC irqchip, which is needed for the Loongson-2K
> > series, e.g. Loongson-2K500 soc.
>
> Where is the binding? I'm pretty sure other drivers need updating.
> Where are they?

Hi Marc:

I will add the binding file in my next version patchset.

Thanks.
Binbin

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
>
