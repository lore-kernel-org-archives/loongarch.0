Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804FE368
	for <loongarch@lists.linux.dev>; Wed,  3 Aug 2022 07:33:42 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id c3so16990563vsc.6
        for <loongarch@lists.linux.dev>; Wed, 03 Aug 2022 00:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=iqxOdJFtC2If/ZXLHcmbp/RBxXGq4jUfEjDF0nOoWWg=;
        b=bARutheAW5JDEHlANZFIG34YL7KjyliUs3ADYEj8NB0FBVD3ex0/HAA7MWdNtbZkXS
         LMcMjXCQPsY0UVRpP118fn6cqycMatWEty3RpS/yCcj+wJplP5XU07iKaNlI1SHnyvHT
         H1h+KkDFZGj4s6uGEyJ2gv6TceB5pXYjQ073fGbsX39ujUH+MK7q4nZCknLlFtJgzkVi
         DCI4zLL9YhuJCTG4JOldcXfcIKrZIt9an9YTkv316kPSc8gHq381PYFWtQGG31nTWM7y
         4GV44xWRP3k0LuEvFomZhzmjme9QpXXjXfpa+m3kSx2TZkhTzsngaxCY2fY2fxocWryh
         21Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=iqxOdJFtC2If/ZXLHcmbp/RBxXGq4jUfEjDF0nOoWWg=;
        b=X2Q5vjQkx/LLd2jkBOSU6BSO2NsD5LTZ9Rtw45cdERelk814z+aILK4olO6mpwe1ar
         7LQWvjRRzFzwl5js6/uUJpaOfbliwZaCYP3yH1jaDE1dL0Ki0R6R2G2g2BI4mzyXIZ4I
         DHaICpk4pzMLBykQPs7S9Lnu8IJFrhq67mj9FozGMzD35dhBfWqqwTW/OchpLOxx8gjm
         wG8P32CP1eubTlxLfS4jr1ri+/DGO2mq5u/m6Yn+2eatquPwl1I+mXuNrYT7D5YIgipM
         0iw9kbBz/2XCJmWQcSJrNDKdK3aaoAXvQLqX5eHkqgNQjB6cR1SttuIhtu6L+JJV9BG3
         fuOg==
X-Gm-Message-State: ACgBeo3yZ3zI7fzOyJnJJzwQUl5xlWkvUCopM11+63A59n2F0DVOs6ix
	8JKXPUxETAZt87ZSvUDBm02OCd/CjkzMHH8V9/JrAVTVOhMc0w==
X-Google-Smtp-Source: AA6agR72RkQdLVyS56GeQwkfOTjaNRQbprGOjzdpCGwhwGtMPqjz9TpqxYtexhsHPMiRst9DAFCqqMgC8reVJ6qeOIQ=
X-Received: by 2002:a05:6102:390d:b0:387:78b9:bf9c with SMTP id
 e13-20020a056102390d00b0038778b9bf9cmr3833027vsu.43.1659512021347; Wed, 03
 Aug 2022 00:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220803042728.3230346-1-chenhuacai@loongson.cn> <87r11xbxox.wl-maz@kernel.org>
In-Reply-To: <87r11xbxox.wl-maz@kernel.org>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Wed, 3 Aug 2022 15:33:27 +0800
Message-ID: <CAAhV-H5d20zj+vnrEYRYW1h7FwRJpGYtJDc1q4hRdPh3KbXruw@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip/loongson-eiointc: Check hwirq overflow
To: Marc Zyngier <maz@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, 
	loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	Xuefeng Li <lixuefeng@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Jianmin,

On Wed, Aug 3, 2022 at 3:20 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 03 Aug 2022 05:27:27 +0100,
> Huacai Chen <chenhuacai@loongson.cn> wrote:
> >
> > Check hwirq overflow when allocate irq in eiointc domain.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  drivers/irqchip/irq-loongson-eiointc.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
> > index 80d8ca6f2d46..f8060e58ee06 100644
> > --- a/drivers/irqchip/irq-loongson-eiointc.c
> > +++ b/drivers/irqchip/irq-loongson-eiointc.c
> > @@ -241,8 +241,11 @@ static int eiointc_domain_alloc(struct irq_domain *domain, unsigned int virq,
> >       struct eiointc *priv = domain->host_data;
> >
> >       ret = irq_domain_translate_onecell(domain, arg, &hwirq, &type);
> > -     if (ret)
> > -             return ret;
> > +     if (ret < 0)
> > +             return -EINVAL;
> > +
> > +     if (hwirq >= IOCSR_EXTIOI_VECTOR_NUM)
> > +             return -EINVAL;
>
> How can this happen? Also, you're allocating a *range*. Surely the
> upper boundary should matter too?
Do you know the exact reason? Please give some information, thanks.

>
> And for the umpteenth time, please add a cover letter when sending
> multiple patches. This is a hard requirement for me.
OK, I will add a cover letter, even for simple fix patches. Sorry.

Huacai
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
