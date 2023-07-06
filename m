Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA6F1848;
	Thu,  6 Jul 2023 11:38:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 7D8975C0262;
	Thu,  6 Jul 2023 07:38:30 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 06 Jul 2023 07:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1688643510; x=1688729910; bh=Pm
	qugGOhYKhlx93f/zQ7NWfwKOLOmLMUQYNWGXgqY4g=; b=nAtZ7hvQJzeSFrlwfh
	Ks8gg9ShiFmECBa+EhMtmqq1Hlwd0yqtPUgcMWqW3CIcJD5FjuTKnG8m8u4WVlsm
	z5dk3kHAw8z2amWZVSpab1+7l7/JNDAQy8ifYbHgDr4zMcPtaNPFljNk08cJRmtC
	mvD301Lv2cEZdPMZqVErJqpapaG+GCeSb8fKro+ZDG8agvQ3vlug0chq5FOGZtmU
	42qw5xqtYy5054msBjh6tOo9c71Nnbwxf0ENnN1HVpYIwLgupl7SHWwExZir5SqJ
	clEhuK9vrELYn0GEzPdt1AJrTRXAVne6LfnVApStx348SvRSJsb0GCFVvMneJiHr
	B/dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688643510; x=1688729910; bh=PmqugGOhYKhlx
	93f/zQ7NWfwKOLOmLMUQYNWGXgqY4g=; b=mkot/Ck7h0gRWgnWxHXGSJLLtNnc8
	82fDY7HSErSSObYCV+Xme2VlLcs/nWLQZJxhmpJMVELM2zl6M2V49VyL73kKMOsS
	NVoInWwxRmHLRP/Xm0e7YbKEfTmO9izrzHFo6X8kTFl1vYhnwUk1MQ/CZoAH/Tk/
	yGHa6HKyerMzVwqz0wlL1vY7yTYcajGnheQcbDyenpOBZki68+QzIbNL/hdNahf5
	1JFPWl9Rje8+GGUEDM+oU65zGgRxCEB57KVHpK8LP70uW4z6D/Zwdow1elTvkevu
	4D3j9GmchiM6J2Waq9WBKs4SweZKiuoyBzhCb1WpYAyUQkRXhcT7d9mpg==
X-ME-Sender: <xms:taemZPu9h247Hnq40K6mDof-wGSsfO_Cjf0ArQKMDmGY1DyEGQdjuw>
    <xme:taemZAeC1Rnt6F1YHmf2BqpGKVlNE7xiTm_2eBar7yBnv578Xt3HB2HK-Qwb5xRh0
    YSDGA9u5Ihsl_l3APc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelgdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:taemZCz_jrpRnm5UvoEg8nykkZj8v8v8TUWqPmflahc6bsUuI2_jAg>
    <xmx:taemZOOZl5HZAk0Sar5iMoqo8WFxWYhO8isa2OHdoinfrnBNaJttbw>
    <xmx:taemZP87ViXQPg7ZsH-LBsEHndf8y3TSRuLvZu50aCSpGyYoYd0xaA>
    <xmx:tqemZGb5oh7dk2UaHXeCwaAkXZ8sl2EwlLhOxuW8udIqz0ta0RrX5g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C3CE7B60086; Thu,  6 Jul 2023 07:38:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <6667d82d-6003-4a7c-a604-7275403d157f@app.fastmail.com>
In-Reply-To: <20230706104852.27451-4-tzimmermann@suse.de>
References: <20230706104852.27451-1-tzimmermann@suse.de>
 <20230706104852.27451-4-tzimmermann@suse.de>
Date: Thu, 06 Jul 2023 13:38:09 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Sui Jingfeng" <suijingfeng@loongson.cn>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, "Ard Biesheuvel" <ardb@kernel.org>,
 "Hans de Goede" <hdegoede@redhat.com>
Subject: Re: [PATCH v2 3/4] sysfb: Do not include <linux/screen_info.h> from sysfb
 header
Content-Type: text/plain

On Thu, Jul 6, 2023, at 12:42, Thomas Zimmermann wrote:
> The header file <linux/sysfb.h> does not need anything from
> <linux/screen_info.h>. Declare struct screen_info and remove
> the include statements.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
