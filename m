Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A800F1107
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 09:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F704C433D6
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 09:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664443441;
	bh=H7JHLr/93+ig4PwnmswWm6dCq0PZUVj12YMVzcMJZ40=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bf79S/qdoPK8DOQALGvYyyVhkHX9BgO+z1kMoG7QInTG6pwB7Zf3Wk80ysWZJF3du
	 xlXdbgRW9HsJX+KNqWSU277dtKStzkyUFc+FoaSd/1wokdNdhQ2mU1/I8w6hVQrgOj
	 tCV4UJTOLxZd+AFoaXYmPYIElDPQ8n7Xx87Ii4/OMrSHKVKWuFcu8srHJdJOIQd9fH
	 uOSC0+ji5gjytilEWOUFHr1znOTHoTZT43FgGeAYxQlWOvW0q7n2fhJ9p7yMH0/Kdh
	 Inz8fqsPD8u2xRJ5f7EPfr4nVZkZKldDg/0S+qC9lQcPqtAOxHy5MSc90dFAJgvAtD
	 FyL1vR4x63NeQ==
Received: by mail-vs1-f49.google.com with SMTP id j123so882584vsc.3
        for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 02:24:01 -0700 (PDT)
X-Gm-Message-State: ACrzQf0McLq756kePRldSgMdcTIq6c+06YmqmGuXj1b2TgIunfaS7dyO
	JRqH+6hTYVQMPvtLX/PXxxxsffXGqtw7aXxh0bQ=
X-Google-Smtp-Source: AMsMyM5MRrfcLtRDsVAs50iJeh3d75Cba3VH4o+MGF65ldGmB4W51Q/mIbnr19z9jUHVyN45Q9UQW3P157izELNf/lo=
X-Received: by 2002:a67:d491:0:b0:398:1bbc:bc85 with SMTP id
 g17-20020a67d491000000b003981bbcbc85mr798429vsj.59.1664443440238; Thu, 29 Sep
 2022 02:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220929091538.9104-1-lvjianmin@loongson.cn>
In-Reply-To: <20220929091538.9104-1-lvjianmin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 29 Sep 2022 17:23:49 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6sxNEOd-gBBkoWrVaicSviz9Qm1Srez9Qg0RP75jHy5w@mail.gmail.com>
Message-ID: <CAAhV-H6sxNEOd-gBBkoWrVaicSviz9Qm1Srez9Qg0RP75jHy5w@mail.gmail.com>
Subject: Re: [PATCH V4] LoongArch: Fix cpu name after s3/s4
To: Jianmin Lv <lvjianmin@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Queued for loongarch-next since I have already sent the last PR for
6.0-final, thanks.

Huacai

On Thu, Sep 29, 2022 at 5:15 PM Jianmin Lv <lvjianmin@loongson.cn> wrote:
>
> Don't overwrite the CPU name on coming back from S3/S4 if
> it is already initialized.
>
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
>
> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
> index 529ab8f44ec6..255a09876ef2 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -187,7 +187,9 @@ static inline void cpu_probe_loongson(struct cpuinfo_loongarch *c, unsigned int
>         uint64_t *vendor = (void *)(&cpu_full_name[VENDOR_OFFSET]);
>         uint64_t *cpuname = (void *)(&cpu_full_name[CPUNAME_OFFSET]);
>
> -       __cpu_full_name[cpu] = cpu_full_name;
> +       if (!__cpu_full_name[cpu])
> +               __cpu_full_name[cpu] = cpu_full_name;
> +
>         *vendor = iocsr_read64(LOONGARCH_IOCSR_VENDOR);
>         *cpuname = iocsr_read64(LOONGARCH_IOCSR_CPUNAME);
>
> --
> 2.31.1
>
