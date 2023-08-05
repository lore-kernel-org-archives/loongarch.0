Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18BC1FAE
	for <loongarch@lists.linux.dev>; Sat,  5 Aug 2023 06:14:21 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fe3678010eso4760097e87.3
        for <loongarch@lists.linux.dev>; Fri, 04 Aug 2023 23:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691216059; x=1691820859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKa1gFCEYJcpfcdueW8n7utVtoVqZuZPA9jW6WxZmK8=;
        b=XDc4jAOG1IHe1+C2tA4Ik7dK3fmto5DAG8lnnJnqxVEGXS+Yc39wa0va0N3yCbEpe3
         siMrZdIxy8ySK2wRWpG65KNJxhEaaw6eghzcwwqWT/4+B2zBBvwAbwlzLg3tKrHZLIB6
         zQmnOPTRjh3xOYBiQ87I8uVDQyeAdcgF8LuTrc9ymFxYBOpMgx/VQuiskEe5B6o384Qt
         CWmZx9vzrvhCr8HNBP2SrjB650ccW3snuI4HTi5b4DCir7KJbojp/6BiqB0ozu4nr9+K
         9T4vgaKdtk+IiURM21HUStoVz/8Og6tI9Z//9AQDRUEIsYuq/HGZqhj7YCFuByj33YlQ
         IITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691216059; x=1691820859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKa1gFCEYJcpfcdueW8n7utVtoVqZuZPA9jW6WxZmK8=;
        b=kFw0MRtLcnHTNWROfXTUYMTMfTw2cRsMloCQufl1hyaPNPrZtl1M1UQctEIdvAItQd
         Ow1c5M4i3mbYrk7rqjQMtBDrvwSggPD9sYykOgxqboTf6o6XFsHvpUIV4BkOSIokIgFg
         0GtBfQDcdr6g1t56Kaxig8CBqISgHfjtE4hK5lkVeJf+nUGJ69TH4e1a5sZoRvJM1N2e
         QK7veY32lN2onQgCuBvErO0gWWEaAFTkTUaqmY8TzHfELD8217/QpnXXIJWSDrcOJ9qK
         NiYDakIA/cxR/mJOZs140VhOPtT4S/3PRUgTVVKg/dblV8XoXpoGZJNiMCouxjFyq+82
         kF4w==
X-Gm-Message-State: AOJu0YxKBv910Fke4k7oKl4C6nObbMBde0i9tY2FalJYWD89ezRmNe6c
	os0YqCusTfNPbROyw0R6J8wtkjlNboqrlO7/szc=
X-Google-Smtp-Source: AGHT+IGTTqwv+OJxqTA8sft4Lmd7dfjxsF/kWcDIC/kMk0awlZAWX1qMnB/h9udQgZuXBWB9kBwstvy8ACDkHMW0lqA=
X-Received: by 2002:ac2:4e97:0:b0:4fb:8987:734e with SMTP id
 o23-20020ac24e97000000b004fb8987734emr2376834lfr.68.1691216059117; Fri, 04
 Aug 2023 23:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1691047285.git.chenfeiyang@loongson.cn> <DM4PR12MB5088C3C2209B392C9CED2C9ED309A@DM4PR12MB5088.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB5088C3C2209B392C9CED2C9ED309A@DM4PR12MB5088.namprd12.prod.outlook.com>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Sat, 5 Aug 2023 14:14:07 +0800
Message-ID: <CACWXhKmmJxWuVWN51jn6fKtJ-2Gntb67hFq77qa7p_F8+WpnVQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] stmmac: Add Loongson platform support
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

On Sat, Aug 5, 2023 at 1:26=E2=80=AFAM Jose Abreu <Jose.Abreu@synopsys.com>=
 wrote:
>
> From: Feiyang Chen <chenfeiyang@loongson.cn>
> Date: Thu, Aug 03, 2023 at 12:28:02
>
> > Extend stmmac functions and macros for Loongson DWMAC.
> > Add LS7A support for dwmac_loongson.
> >
> > v2 -> v3:
> > * Avoid macros accessing variables that are not passed to them.
> > * Implement a new struct to support 64-bit DMA.
> > * Use feature names rather than 'lgmac' and 'dwmac_is_loongson'.
>
> This is still mixing up with HWIF.
>
> As I tried to highlight before, if you are using a custom IP,
> you need custom callbacks.
>
> As far as I saw, you are mixing dwmac1000_core with
> Loongson registers, which is not what I believe is the best approach.
>

Hi, Jose,

The problem we encounter is that we have three different layouts of
register maps. To avoid mixing up with HWIF, we should use three sets
of callbacks with rather similar logic. Maybe I can extract the common
code blocks to functions, create two additional sets of callbacks,
namely dwmac1000_loongson and dwmac1000_loongson64, and then have the
three sets share these functions?

> I understand that stmmac is confusing and needs a lot of revamp.
> Perhaps we can switch to regmaps first? This way you would have
> a lot more flexibility.
>

If we switch to regmaps, we still need three sets, and I think I need
to revamp more :)

Thanks,
Feiyang

> Thanks,
> Jose
