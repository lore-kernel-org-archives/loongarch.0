Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE0B7C
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 01:51:54 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so24412641fa.1
        for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 18:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690509112; x=1691113912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spl6msirgwM12Bz3dNNSl2svImPXOjpVr2B1RLvkZXY=;
        b=DwhhtH676J+xnO7Ti6I5DxRcKK1/tNIiUspuBI2YPxQbBzWU23RspV7Z8ZIQ1Qn4WP
         nzyVMC8VSYzI3UGV85rrIyEQ3RKhqyYcs1Q9Moy6o1muJnUi0SKzgiKh7lW9qn21TDjB
         hwnreAuKolsWCAl/trzGZTbWEZVgicqIcztfZ9dh4x1idm4VMtQ7GDopkOpQISulzIwl
         iw3g8RqM2xLBmnlqH0oC6WXQ7WD4R2yyGvdvXwIBAJSgPG79eTcHfaSp4kFNlBQA+Jky
         GglqPSj6325MHZBm9xUJFLJu7zlz9eVJFr3DTrOAZHm4XgY99xUgfyibeb+cSc3kJC2B
         hrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690509112; x=1691113912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spl6msirgwM12Bz3dNNSl2svImPXOjpVr2B1RLvkZXY=;
        b=cCXei2Id5y+63+w232A1h3GT/cmI60wdTvHEdsxLlqe5l9xoG0GmHPYu49TsaR+EII
         gXE7wUrQWxm6yaTLpZQFR7FF2Q/AvOCPmmOvs4UdJ+P8utMH8GIFNWKFq0LWGC2KbpW9
         nOMGSbW5EjuzdDInMw7CyzaZtMKQk7xr35MrvaKbDrZ8P0sUsd2BwTrGwAasWrZCYQ6c
         hcOEpEhcnwNRGwkbIRPxwhR9838fmB1b3SJbo1ODMGx0EZGpIdWHe3QCKN318sUmK+4Q
         74RiJCrEt+tdf0gwZPh5DBG4wvBVwA4oXPM89G6TfB9zSxRP+teHcnTOhXyhgw3o11k/
         QHag==
X-Gm-Message-State: ABy/qLZnqmA6UMEcL/wWxUffIwiwQxhz3nd3GPgEfqQkVWq06JLIVQv3
	OTthIzabkY9TfgG2d1IhSZoqLHq8YOrAShU6mn0=
X-Google-Smtp-Source: APBJJlELIy6CzI7EadvaDv1i5jG2qBH+5qOGvagZFAIrDNAR32mZVOSW6K2uYyaAw2I57TwBIT220Ok980xXve9eHKM=
X-Received: by 2002:a2e:8816:0:b0:2b9:ac48:d7fe with SMTP id
 x22-20020a2e8816000000b002b9ac48d7femr523226ljh.38.1690509111900; Thu, 27 Jul
 2023 18:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1690439335.git.chenfeiyang@loongson.cn> <373259d4ac9ac0b9e1e64ad96d60a9bbd35b85aa.1690439335.git.chenfeiyang@loongson.cn>
 <51338bc8-92b0-4aab-92f8-1e5d178b05d7@lunn.ch>
In-Reply-To: <51338bc8-92b0-4aab-92f8-1e5d178b05d7@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 28 Jul 2023 09:51:40 +0800
Message-ID: <CACWXhKm9Qu3CUjGpqa_5dx74MDVHODKVrsotTi0+V03zDBVqwg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] net: stmmac: dwmac1000: Add multi-channel support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 5:01=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Jul 27, 2023 at 03:15:46PM +0800, Feiyang Chen wrote:
> > Some platforms have dwmac1000 implementations that support multi-
> > channel. Extend the functions to add multi-channel support.
> >
> > +     priv->plat->dwmac_is_loongson =3D false;
>
> I don't know this driver, so my comments could be wrong...
>
> Is this specific to loongson, or multi-channel? If you look at the
> other bool in plat, they are all for features, not machines? Could
> this actually be called priv->multi_chan_en ?
>

Hi, Andrew,

It is specific to loongson. I think I can add some features instead of
using dwmac_is_loongson.

Thanks,
Feiyang

>      Andrew
