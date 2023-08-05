Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F3B17C6
	for <loongarch@lists.linux.dev>; Sat,  5 Aug 2023 06:15:19 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fe3678010eso4760771e87.3
        for <loongarch@lists.linux.dev>; Fri, 04 Aug 2023 23:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691216117; x=1691820917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4M7nMTGRw7KfcQ96lwyRUaadHg5/rmosqdVLwPSAnI=;
        b=roA6BYlwpOXOuJve46gTJ3PcQBuIzIF4yYfbR0rpC65W9qV0RpWi1t5dhzf0Yzh5Cp
         UDfeBDCFBvdfH5nrCcIPqhotxrBWNfbpgEVrp2xmTozpCafdJLN6nRYBYMxsAk3gAGC5
         lyYuOiClTrlj5P7ltNbAbi3SpCz/hiTcQnU3owuvaFa5XL2D6FVhKcqPzuC5PmO3ktu8
         Pwlc9W0AgSp7Nh0ivMdKRzNlUPb8NG+6gNoQZD7nftKzz9y/eZa9FRs8yPCM13sU3GI9
         F4NqtUbgKJ9iH8F1xKZu/FrLQQBb/ADN0k1JjWHb2R3qLfcDMC9FBS1eeSE+T09OAEkb
         WvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691216117; x=1691820917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4M7nMTGRw7KfcQ96lwyRUaadHg5/rmosqdVLwPSAnI=;
        b=a5J4SFLCX6oQ5A6/GuYx1TfTHqwxzXpr2TW7j1mYE32PbBuReYY3BZfA4HmKBjrFwC
         EPAp6ASAt2mpgVxRX/gsGIFA2uFbrveVN19mGGyfbOGPJCw8lPYBkFDfxzv+kv/QKcCJ
         z0a//D2yY0g/iPd9bD/w+N5MR/uGvcztbavetA2Ds9eqE8xb1OqnrB/9t8IOqo94hmT5
         5OpohKYBNG1GQpDtClBWqTu76gpPPzmKP4QIkkscYG2EnJD9td1DuvTouLKzj6h0dIuT
         KQZqvrXvlRWk+IlPhYZwxF1B+/JLw861ApgedYiMRiHND289kJlJ/1+yYIHtb0oglyYw
         Psgg==
X-Gm-Message-State: AOJu0YzCLpBjmkBszDbVKgK63xDZ/a8W5Gt4Cfp/C42XXm3ifsDxJgGA
	6Nzn4KEdKOEkIU/yG/plgNWiDHF6oMBiTMpy7ns=
X-Google-Smtp-Source: AGHT+IHTtLwOEGQZl+ohLm6pAe7c30jvFwwLmwdijBjjcIS9kpvbLH4m0JCiNdKuIauEuR9VqNABxtPvJv24CMVazBo=
X-Received: by 2002:a05:6512:3b7:b0:4fb:81f2:422b with SMTP id
 v23-20020a05651203b700b004fb81f2422bmr2176422lfp.54.1691216116956; Fri, 04
 Aug 2023 23:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1691047285.git.chenfeiyang@loongson.cn> <021e4047c3b0f2c462e1aa891e25ae710705ed29.1691047285.git.chenfeiyang@loongson.cn>
 <DM4PR12MB50880DE89F513EFED10E2B95D309A@DM4PR12MB5088.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB50880DE89F513EFED10E2B95D309A@DM4PR12MB5088.namprd12.prod.outlook.com>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Sat, 5 Aug 2023 14:15:05 +0800
Message-ID: <CACWXhKmOo9JHsjex=8i6UuBdAxqFUGP58zcWn3KjGgNqucewQw@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] net: stmmac: dwmac-loongson: Disable flow
 control for GMAC
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, "andrew@lunn.ch" <andrew@lunn.ch>, 
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>, "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>, 
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>, 
	"chenhuacai@loongson.cn" <chenhuacai@loongson.cn>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
	"dongbiao@loongson.cn" <dongbiao@loongson.cn>, 
	"loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 5, 2023 at 1:29=E2=80=AFAM Jose Abreu <Jose.Abreu@synopsys.com>=
 wrote:
>
> From: Feiyang Chen <chenfeiyang@loongson.cn>
> Date: Thu, Aug 03, 2023 at 12:30:35
>
> > --- a/include/linux/stmmac.h
> > +++ b/include/linux/stmmac.h
> > @@ -360,5 +360,6 @@ struct plat_stmmacenet_data {
> >       bool dma_reset_times;
> >       u32 control_value;
> >       u32 irq_flags;
> > +     bool disable_flow_control;
> >  };
> >  #endif
>
> This (and other patches of this series) use a bool flag instead of the
> Recently added bitfield flags, can you please switch to the bitfield flag=
s?
>

Hi, Jose,

OK.

Thanks,
Feiyang

> Thanks,
> Jose
