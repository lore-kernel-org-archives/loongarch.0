Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9B73211
	for <loongarch@lists.linux.dev>; Sat,  1 Oct 2022 22:05:22 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id b2so1903685plc.7
        for <loongarch@lists.linux.dev>; Sat, 01 Oct 2022 15:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=I7JqWW70Kl7IEMXaO3wvfoltNONqFvJwW8PmLRCKkHM=;
        b=ISESwcDmguedJbf16QBUBnjNWI4g9+oBk4jzQnhzPx9nIeMxhzCwF5v814Mnza1IrV
         rtAJ3iHGMISOkOc58FvzUnt6eKjf2g7TshaaXaZBNikmwcBy04R9WWyVR49A1mpmcm9A
         n0DW0xxrgn7/OQFW61stldmwwMOUg9Ubx/KY2wtpWlfNFVV0RyAi0/j0QyadmM/BbHgR
         0MD/lO0+J+AICf0Di126i492UFl9Gk3tHmmZMaeVVnEX/EHcKY/84QhSit/oxiMfDj6Y
         dpsK7mjr5SG0uvzA5mbRXBMXJMzW0cWxdjC8HZfyi5dQa1VsKeacDz2Sf8Z0alhb6/V4
         AcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=I7JqWW70Kl7IEMXaO3wvfoltNONqFvJwW8PmLRCKkHM=;
        b=1Bcr/1zG2mHst1tz/OZ2erw05ieoRyXjcuXM1NAkVUA2t+r7TgpnPqQFPu7URBFMiy
         WZLjgTzixnqOJQl0OI5Nzp74cmdtB+JVlgwN2iGsPvVwoFNTkiX1OhT06D34NoEhcD1/
         zoppSci0yuFDdr+ct0zOLJdp3/tyJqrbILtForxhXC/F7JPbTULex+nJO0ml0imKLc8v
         OfPRc37u68KOGBtPU+KJxKnO+UdFf13vCRgNIOG/KePt9fBRiXvccfBUNMgkrfTiS1uJ
         NgVZEhQ0CoiMYq/XsUVYqHFB/ITT3pjtCRDNYuYIirIsvIroDvIboFxD6mlun6BYHkMc
         Hr5g==
X-Gm-Message-State: ACrzQf26Z4l/AzuUKEMiRB0hZ2o7UVb+EdvzOO13FHmzLORvG2sPlO6T
	W1aiBK8IEfpZLSatCgQ+IeA=
X-Google-Smtp-Source: AMsMyM7edeL+zbuxo+AKakfLc2ZG2Nza6yyxoiNhQIWu3lVaW/UCq2b81Ui/vDRrch8MMXPzNiPWkg==
X-Received: by 2002:a17:90b:3ec7:b0:202:b984:8436 with SMTP id rm7-20020a17090b3ec700b00202b9848436mr4957641pjb.4.1664661921681;
        Sat, 01 Oct 2022 15:05:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:63e7:415:943b:4707])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903244c00b0016be596c8afsm4378055pls.282.2022.10.01.15.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 15:05:20 -0700 (PDT)
Date: Sat, 1 Oct 2022 15:05:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
	loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: i8042: Add LoongArch support in
 i8042-acpipnpio.h
Message-ID: <Yzi5nWCeVYV37Htb@google.com>
References: <20220917064020.1639709-1-chenhuacai@loongson.cn>
 <20220917064020.1639709-2-chenhuacai@loongson.cn>
 <87a66rhkri.fsf@baylibre.com>
 <CAAhV-H6YLstS+GqaXv2Y9p_QVAU4x=nrunP_Hd2GeznOWG6q4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H6YLstS+GqaXv2Y9p_QVAU4x=nrunP_Hd2GeznOWG6q4g@mail.gmail.com>

On Fri, Sep 30, 2022 at 10:41:59AM +0800, Huacai Chen wrote:
> Hi, Mattijs,
> 
> On Thu, Sep 22, 2022 at 4:32 PM Mattijs Korpershoek
> <mkorpershoek@baylibre.com> wrote:
> >
> > On Sat, Sep 17, 2022 at 14:40, Huacai Chen <chenhuacai@loongson.cn> wrote:
> >
> > > LoongArch uses ACPI and nearly the same as X86/IA64 for 8042. So modify
> > > i8042-acpipnpio.h slightly and enable it for LoongArch in i8042.h. Then
> > > i8042 driver can work well under the ACPI firmware with PNP typed key-
> > > board and mouse configured in DSDT.
> > >
> > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> >
> > I would have split the pr_info() move in its own patch since it seems
> > like a "valid fix" on its own, but i'm probably too pedantic about this.
> >
> > So, please take my:
> >
> > Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> I think the pr_info is needed for all architectures, and the moving is
> very simple so I haven't split it. But anyway, if Dmitry also thinks
> this patch should be split, I will send a new version. :)

The reason for ia64 not emitting this message is because we "trust" ia64
firmware and it is quite normal for it not to have i8042 implementation,
whereas there are a lot of legacy devices on x86 and not having PS/2
keyboard is still not very common.

I moved the pr_info() back into x86/loongarch branch and applied.

Thanks.

-- 
Dmitry
