Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFB67B
	for <loongarch@lists.linux.dev>; Thu, 18 Aug 2022 05:01:34 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id z6so694461lfu.9
        for <loongarch@lists.linux.dev>; Wed, 17 Aug 2022 22:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=r4rJdvHK9Uejgurp/zzqjNfe8hbrR+MHgAvSS9UTA+A=;
        b=jJx0XeBwUX04oH+nMocHYwHkcVLGMr2iOq4E5u+1KRGBiAi9ICcn2TXNCYec3F/PRr
         PANX2SiNceJlQkAj42Vq+l19WKcX2rFvu66jLO9ngUmOUwxnvOpQRPW89yiRPG7Tmro2
         nf2RD3rNpVZ2is7WOw4qPRvkAZvP3ZgIP9EIPMmZF1rQ4Ll5XgdkXizGfauBT1ukKUYO
         GgljTpDXRtPwcwFG/1n4ebPOYe8DNsYcAN3bXKjRWgYw/GpJo1mR0MewwkLCtvYRO0DB
         1RG2lfghhXXTDzQGTlIo8cGEB/qJjNAwXm5XGJQtRHDyvMShPWOc3V9ZPnz0PDD5CCL3
         ZNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=r4rJdvHK9Uejgurp/zzqjNfe8hbrR+MHgAvSS9UTA+A=;
        b=pMgZ2xJ8ebbEgmTpsvlN0Xo4XjLhGWOXBxomLIbQzW0l0wV0cqxM4br8LWbEhmeXhi
         ozNvxDojhQW5lCl5nNZ9hhH/qRTMBJpfsKo8nCqP0F/txWN90qSeUERVKYE8qPkO2kXQ
         swwj5j4+Q+TsdUy2R1wA8jdEOfy8agYyz3l+PEyT5Dw/cRKHipa9vEAl61AKx4dl1BTa
         RlhllacHuhXNlXVIf6aOGYGdmQDnxprY/apNqFIG8QLLOY/OETowYg4LiS9YBI343gK6
         L+0imA1XZcUoVHSZiVQ/m07E+Z1zNJSQbNg1mHFOB3gt4oDBSADRc1gMGW5299Bq7fDW
         a3HQ==
X-Gm-Message-State: ACgBeo1jK9Zo5d31WbuzTpKzT6foyf1eaZY/byGu7dPAGmEdaErhGtP7
	4wdJAlcbr71is0bbyNlk+u7+SonXWTDKjjCjVUk=
X-Google-Smtp-Source: AA6agR4HkqVa3ZVJ8+4jlx1JF+zxWWDG6Zaks1ax8/M/BHZYH/orv/EMMbIX217INMOKoaliy8cUJhd3jw9K8sBxvFg=
X-Received: by 2002:a05:6512:3e1d:b0:492:b9b1:bc1 with SMTP id
 i29-20020a0565123e1d00b00492b9b10bc1mr397355lfv.278.1660798892408; Wed, 17
 Aug 2022 22:01:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220816102537.33986-1-chenfeiyang@loongson.cn> <Yv2hlkIpd8A66+iP@lunn.ch>
In-Reply-To: <Yv2hlkIpd8A66+iP@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Thu, 18 Aug 2022 13:01:20 +0800
Message-ID: <CACWXhK=YF+z0wofjDAo7XW8cSV2NZgHpAK3u5=rkvvKTd8MjFQ@mail.gmail.com>
Subject: Re: [PATCH] stmmac: pci: Add LS7A support for dwmac-loongson
To: Andrew Lunn <andrew@lunn.ch>
Cc: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
	Feiyang Chen <chenfeiyang@loongson.cn>, zhangqing@loongson.cn, 
	Huacai Chen <chenhuacai@loongson.cn>, netdev@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Aug 2022 at 10:19, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Aug 16, 2022 at 06:25:37PM +0800, Feiyang Chen wrote:
> > Current dwmac-loongson only support LS2K in the "probed with PCI and
> > configured with DT" manner. We add LS7A support on which the devices
> > are fully PCI (non-DT).
>
> Please could you break this patch up into a number of smaller
> patches. It is very hard to follow what you are changing here.
>
> Ideally you want lots of small patches, each with a good commit
> message, which are obviously correct.
>

Hi, Andrew,

OK, I will have a try.

Thanks,
Feiyang

>       Andrew
