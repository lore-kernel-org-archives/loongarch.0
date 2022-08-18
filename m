Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141297B
	for <loongarch@lists.linux.dev>; Thu, 18 Aug 2022 05:01:23 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id l1so189092lfk.8
        for <loongarch@lists.linux.dev>; Wed, 17 Aug 2022 22:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=i50TsWfzD1rOYDA+g6ULxMvaHUt5/Y8yXObW0WH7gXY=;
        b=b/gGpCQ8BeUba83Z2cWrojMiMEZ7zRyZUMUKmVQzVNWpZkTYA24KeNj/HZxrY9ghZz
         ji6xgql4TvZF89UH6xh4/slpJhegH3A1twx+hb2GgtkYddBxY73IR3CqsU/rMgHj/+dq
         WPK6zi1qcyQsTw2R16fr24UbXifu6mJtuFKKsFw9i5GfPrsmB6+3CG9i2xLpD1K9sqhz
         7EV6CDhMLPopOG5PIHfSEKz0eT/aImei9xxPlH01lC95w3eGoSmvlF5VedAJ6ZwasGyY
         vKyKz7J7632xXbbxD3y6ec6Lbm/aE7knmxEZngRgz+U4jHzEpwD9kyOB7jkzb0aYw50a
         6d6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=i50TsWfzD1rOYDA+g6ULxMvaHUt5/Y8yXObW0WH7gXY=;
        b=xDpVz5IIoDO6inhr5//23CeUEAs8FxV5lPnBWBIcr7eJCUalRiMmogTlzuRYdy1xqV
         u62C2QXD5iarU0Yy3XCMZbX1vvKIwWJUm9QtNWHOsmN7LTpHoaXteK6BxfVoq+n3yj4S
         EeFToV302Gv3ufvgtcaimu9UjwCgJhi5Alp+MvTHplp+9S+UhPIg4VYDyb6tTz40fxm6
         ycHpV72aY5wyZ40wyMho1yjcROKSUoOQ519DvGWxknuvL/tueUlgUZc1q6YRAr9cOw7x
         X+3xK6EKAh7n/SJNybXEyOevSKRRv6F0rEvDPZAl0hpKnipd6QvdzDhoFadBKqtLiKzd
         xOgQ==
X-Gm-Message-State: ACgBeo1aCPJWg0qJXqg+y+5aelLlluRM3DP0FzAYJ63dexAUZ1joYobk
	oLCT0NGW0OrLjXcnT9rpu+NcaO1BlJ51GrpSCow=
X-Google-Smtp-Source: AA6agR7gZ/R2sxPTmG61RwKPKjQwsCfbRryiN2jfbyB2gVg7z34LZklaPwqPIySvDpp4IZJ5Kt26XGMW2ll6jUyjRno=
X-Received: by 2002:a05:6512:ac3:b0:48a:fa85:7b20 with SMTP id
 n3-20020a0565120ac300b0048afa857b20mr397579lfu.340.1660798881945; Wed, 17 Aug
 2022 22:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220816102537.33986-1-chenfeiyang@loongson.cn> <Yv2gy3I+yLzU1dYH@lunn.ch>
In-Reply-To: <Yv2gy3I+yLzU1dYH@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Thu, 18 Aug 2022 13:01:09 +0800
Message-ID: <CACWXhK=aS9Y+hWxCoE3-Y7=T+C9VyuSD_jiegviAArFde1GSWA@mail.gmail.com>
Subject: Re: [PATCH] stmmac: pci: Add LS7A support for dwmac-loongson
To: Andrew Lunn <andrew@lunn.ch>
Cc: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
	Feiyang Chen <chenfeiyang@loongson.cn>, zhangqing@loongson.cn, 
	Huacai Chen <chenhuacai@loongson.cn>, netdev@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Aug 2022 at 10:15, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +static void loongson_gnet_fix_speed(void *priv, unsigned int speed)
> > +{
> > +     struct net_device *ndev = (struct net_device *)(*(unsigned long *)priv);
> > +     struct stmmac_priv *ptr = netdev_priv(ndev);
> > +
> > +     if (speed == SPEED_1000) {
> > +             if (readl(ptr->ioaddr + MAC_CTRL_REG) & (1 << 15) /* PS */) {
> > +                     /* reset phy */
> > +                     phy_set_bits(ndev->phydev, 0 /*MII_BMCR*/,
> > +                                  0x200 /*BMCR_ANRESTART*/);
>
> The MAC driver should not be accessing PHY registers. Why does the PHY
> need a reset? Can you call phy_stop()/phy_start()?
>

Hi, Andrew,

This is a PHY bug, I'll try other methods.

Thanks,
Feiyang

>      Andrew
