Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6F9A40
	for <loongarch@lists.linux.dev>; Sat, 10 Sep 2022 07:53:23 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id v1so3812647plo.9
        for <loongarch@lists.linux.dev>; Sat, 10 Sep 2022 00:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=JE+O0JjBaUaKaVbXBPjztEKOPO7pJKl9qx1EvIyCmeg=;
        b=cvZJIBqGw+0ibOxmX+2fb/j2Y70TPEysHn1ZyDWt4NtukFlD84lWxjHmLm+5vXJ+VJ
         KXVReY8lhuzBkeoQdI7cqq4CEGfH6ZTdjzNeF13E1LDMcxz87nP6HidR7yqXFQU1vbnh
         AFBCIQriexf4bFS7x6XlHr4yXe5h214hVucA3T2xooH1iY/urtq9/xFfF+fNYNhSazGp
         s44Y7FJm+0cx4aAai0rYk6VbcIjmSTh5h7jqgPsI7/RNW8pRFTd8/HnYFNpqYW6qV08Q
         u4byXDmpYkU4fdgZVV/tCI7UrKUMeRH8yPvPvt+aTkXy8pnKHYljhWXg0m7Nm+SlAE88
         zgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=JE+O0JjBaUaKaVbXBPjztEKOPO7pJKl9qx1EvIyCmeg=;
        b=rZ9C8H7M2g+vHdeLSD5awXCngKgLDV9J3Z8WcVHtCWfwJOqcSGgL1tSbVX5EMbkAKT
         AxmCdHzI8WvNub/jnCIW1sd3wkH+r+3xVKYLtfYinEiT84HgR5eUNl9opYYYyS8d03gw
         UjOdxZBB7lnNou+rXKgMop7Rnpe+1+EE/QfF/TxTUJc4Q5+I90EIq0GwJDPqKWP6431g
         L2zuJRxz3Lq6VKYDPHuNiiEv6HR2sPaz7wScJW+hAf9J7dT3wl+vJWn/lefwE8fhA0BZ
         EXX9iUAu6PP0T3jseo4xyjnnNsMIq0brCdMnHsAzcL/uWlN3a0OIPD0VPiIP9uKQQVL6
         NRbw==
X-Gm-Message-State: ACgBeo0HTbMtI+lWYIboDjLcol87CXzqre2VOj7h3DOaHguElQSffnqz
	KB21/Mb6PDA0V5FCR0lOVP4UrQ==
X-Google-Smtp-Source: AA6agR5WNWyuopz0i+tWtj4d6z/9P1Jiwgf7f0mslhclROc9ftNMoa4vQmNLf5f/958mh31IrCT/nw==
X-Received: by 2002:a17:90b:1d02:b0:1fe:36a:6e01 with SMTP id on2-20020a17090b1d0200b001fe036a6e01mr13521195pjb.102.1662796402707;
        Sat, 10 Sep 2022 00:53:22 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:200:3bf1:3d60:1b12:a903])
        by smtp.gmail.com with ESMTPSA id z12-20020a170903018c00b00176d4b093e1sm1717555plg.16.2022.09.10.00.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 00:53:21 -0700 (PDT)
Date: Sat, 10 Sep 2022 00:53:16 -0700
From: Fangrui Song <maskray@google.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic
 relocations
Message-ID: <20220910075316.no72fdyqjvunomwm@google.com>
References: <20220830193701.1702962-1-maskray@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220830193701.1702962-1-maskray@google.com>

On 2022-08-30, Fangrui Song wrote:
>The actual intention is that no dynamic relocation exists. However, some
>GNU ld ports produce unneeded R_*_NONE. (If a port is not care enough to
>determine the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
>relocations. E.g. powerpc64le ld as of 2.38 has the issue with
>defconfig.) R_*_NONE are generally no-op in the dynamic loaders. So just
>ignore them.
>
>With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
>bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
>not called "absolute relocations". (The patch is motivated by the arm64
>port missing R_AARCH64_RELATIVE.)
>
>While here, replace "egrep" with "grep" as "egrep" is deprecated in GNU
>grep 3.7.
>
>Signed-off-by: Fangrui Song <maskray@google.com>
>---
>[...]
>

Ping.
