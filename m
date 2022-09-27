Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91DC62C
	for <loongarch@lists.linux.dev>; Tue, 27 Sep 2022 12:32:23 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id g27so4849026vkl.3
        for <loongarch@lists.linux.dev>; Tue, 27 Sep 2022 05:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=qikns/GO0HK79nuBO+XHthWmQJO+zDe5/PqMTWeNaJo=;
        b=CY98cOIMNBpJ33H5q7aB0pV39ZUfBY0ghgR3H2VqMy+f9Netlbce9kK/cI7KGh20Cf
         YGV2xI9TIYRJfbsJVDUu6mS08GSjZVcGldYOIqmsPrirJ4m9OTCbr2EjClDgw4MPqqba
         kx9q8LHywYmky+mgOUJe92xZspC6DMrGekl4Tlv8of7uTSrm1HxA5OY3xYVAihQ3MEYV
         I8LAxttdCQAVcHxdioQMKPUKSbG/CvBT2ssDXpNWsTUvjMIMpdEZLMbBvger9eZoB4R3
         fmqb6ZDbeR5Dfcqi4yfYuSpi4vaUVKXm56vjAkm+dQTNgBLTKNQVbGgG844vI5dWZ406
         acgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=qikns/GO0HK79nuBO+XHthWmQJO+zDe5/PqMTWeNaJo=;
        b=nhbf4Zmfzw21Iis5GLQvuaCl8U3Nb74Qjj8dBUoaGIFdYsfgtYo2zwD+CqOoqzBjRa
         4fq8MwPq1hOfFSGGi4pvQUPeucKpXT9+YnLDHZhDlo8JIdad9CbdwVZWRBYY2Rd6Qfic
         qDtBlzvFH/CVUo0/ZyA7uwB/7DcXotnsUNamm9gJw3f0N+O6zqodkjQ2is2J8rpXHMO6
         GiWnifmjbV/C23qxg+bc9sWUskXgSCtHUdF3IMAO3aJfFci3cLJPh/NQ01cuwu/4cS7h
         DEv8lw/aRULa+oRy1hhSFlqDPE65H8eQW2x6gnWiv/i9jiuiuF2pGhWYgn5ctDwDvUK/
         iF3Q==
X-Gm-Message-State: ACrzQf0rehk7rSjbfOpcgm81BHwXj8mJjo9GOwvdYgm5mSd6c1l7XhXG
	EyglWhaPc+jFbLhCuIkQHiPe9FSpknMZYZ/TDJx5iqM53j4RsjIA
X-Google-Smtp-Source: AMsMyM5K3vAI87c1DjRjTQjJNndJPHlRbd2M9Fianx1WFom9QGlFpzMHr7IwWc3aYi4JTcpn9sKh8zhJg63LMTWUpgA=
X-Received: by 2002:a1f:a90c:0:b0:3a2:ddcd:a0d5 with SMTP id
 s12-20020a1fa90c000000b003a2ddcda0d5mr10894647vke.19.1664281942807; Tue, 27
 Sep 2022 05:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220927045514.2762299-1-chenhuacai@loongson.cn>
 <e0efb8a9-b4b0-47bf-ab84-ea71c3630f9d@www.fastmail.com> <86tu4t6obg.wl-maz@kernel.org>
In-Reply-To: <86tu4t6obg.wl-maz@kernel.org>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Tue, 27 Sep 2022 20:32:11 +0800
Message-ID: <CAAhV-H4shgJZ9_zazOVBpKVDw-x_d55Hwk0Muwqokt-W8-nLCQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip: Make irqchip_init() usable on pure ACPI systems
To: Marc Zyngier <maz@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>, 
	Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 27, 2022 at 7:37 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 27 Sep 2022 03:51:04 -0400,
> "Arnd Bergmann" <arnd@arndb.de> wrote:
> >
> > On Tue, Sep 27, 2022, at 6:55 AM, Huacai Chen wrote:
> >
> > > @@ -28,7 +28,9 @@ extern struct of_device_id __irqchip_of_table[];
> > >
> > >  void __init irqchip_init(void)
> > >  {
> > > +#ifdef CONFIG_OF_IRQ
> > >     of_irq_init(__irqchip_of_table);
> > > +#endif
> > >     acpi_probe_device_table(irqchip);
> > >  }
> >
> > I think that #ifdef should be in the include/linux/of_irq.h
> > header, with an empty inline function in the #else path.
>
> Agreed. Please keep the C code free of #ifdefs if at all possible.
OK, I will send V2 for that.

Huacai
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
>
