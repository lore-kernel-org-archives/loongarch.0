Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FC13211
	for <loongarch@lists.linux.dev>; Sat,  1 Oct 2022 22:11:32 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id h10so4074847plb.2
        for <loongarch@lists.linux.dev>; Sat, 01 Oct 2022 15:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=SRtG4ULOwUXYrlLbHbqAnJPCi/RzxeyqQsFq7yJUZCQ=;
        b=d6s6NGvPgWYKNtUDzbG8ra10Za7gavuLMKk7g2peadO4GMYxfOJdfq0McqeSel1QiW
         phbeh6UoLqiGoEwrjhTLy/iFW2yrcWN3oXPiU9fJxbGEljppIg5luWHBt3WvXwNMZNK0
         fSZ7XUq5c/2mee3+ygplZtwXVOBlRRWxL9/dQm8c8X+02vG0aUaLh78ZtmRSGH71hzd7
         hm/mLdFh3V4QOj8KqV38AX2d40XCoRmhm3Dp0O3MDk4B9csaiPDKQuT4AxnuCwW/VvIW
         wUVjGwFTcqWb25G23e16Yim95QikpxgfebfdP6Sh1Yzm+vK+j6D15IPSH2K7e65F6Yy9
         Mtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=SRtG4ULOwUXYrlLbHbqAnJPCi/RzxeyqQsFq7yJUZCQ=;
        b=CpUUaJzkDUJ+HPdK/oddKphaIwMP80aUxoiXYr6D6xTX/Iq1nyuLa7Pd/2h4+LoOHP
         lKKjYA2/xJFQq6hdeHCpq4WokEcbMDMEeFYE9y4acANbrRBSQDVJJmxWV3ZSr+d1gWbD
         pun3voqgQ5ggH/6W4ZS8eU0BbPwrz6JtCYqX+9dzZlwnTlZPFa9Ny2QIGbq4dP1Yz/Pq
         WqUkFwFlc1FHg2Mcw9kKikkjO9mENXnLgl44zG5VnxohMGmUA5gmSMV/xebGiytkPPYb
         HvIjH4z3046tQSPUEWBBAKygKV/UuGE0CVXsE0roFEjnKD/DfrRhDBtav+rxCvh78Vsd
         VgKg==
X-Gm-Message-State: ACrzQf1OzELgIj3pqrnk9P8WE+LqJxV3NuV31YOLI3b0WTIsdH5t2c1S
	LHhdGY5y0Bgr1iPGi0W4T5s=
X-Google-Smtp-Source: AMsMyM50kpqeLm3S2yWgpaeK/DsupHNloziLLUitR6V/wRmlQACr21LF1v9ZrphojveaI9hPgPwqeA==
X-Received: by 2002:a17:903:2411:b0:178:5653:ecda with SMTP id e17-20020a170903241100b001785653ecdamr15676190plo.166.1664662291950;
        Sat, 01 Oct 2022 15:11:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:63e7:415:943b:4707])
        by smtp.gmail.com with ESMTPSA id x13-20020a170902a38d00b0017d061a6119sm2859135pla.116.2022.10.01.15.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 15:11:31 -0700 (PDT)
Date: Sat, 1 Oct 2022 15:11:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: i8042: Rename i8042-x86ia64io.h to
 i8042-acpipnpio.h
Message-ID: <Yzi7EBrSXhfm24zU@google.com>
References: <20220917064020.1639709-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220917064020.1639709-1-chenhuacai@loongson.cn>

On Sat, Sep 17, 2022 at 02:40:19PM +0800, Huacai Chen wrote:
> Now i8042-x86ia64io.h is shared by X86 and IA64, but it can be shared
> by more platforms (such as LoongArch) with ACPI firmware on which PNP
> typed keyboard and mouse is configured in DSDT. So rename it to i8042-
> acpipnpio.h.
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Applied, thank you.

-- 
Dmitry
