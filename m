Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A6528E8
	for <loongarch@lists.linux.dev>; Sun,  4 Sep 2022 12:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B092EC433B5
	for <loongarch@lists.linux.dev>; Sun,  4 Sep 2022 12:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662293688;
	bh=GcOMib9mDyZZIUGaE0NmPgTZaIht5PCXuFBHIHco9Wk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=STPoOYc1KgwvJd8FCK4YW0qGULcFCUcVbeiWJ/hmMe3NOOOaAioJTCQiot47aFDxY
	 7MhkbTDwheVxsH+ov6iIe1pBPF7D4K9jEjDfghaEggXqSmjPouYx/Mtt+IWVe1AcVv
	 sQCPnswt0h9whAFsHOccIkFaATifXdLj60j8+hwWAGm+C6oWFPY8M9iR00kASnW1uk
	 1d6gARM6SnqwkYXmMYMWreu9JFqeMoRphF8rKHCTogTM8dR1Puws1oS8k3NxFO6xz3
	 BofcnEPdd4Pbs9CtvjR9zEQx1WYtDEjTje0qrCLHPJ2mpEiKapND2a69dfzifG2Eun
	 tAtqoZAK+WRHA==
Received: by mail-vs1-f47.google.com with SMTP id v2so2897947vsb.4
        for <loongarch@lists.linux.dev>; Sun, 04 Sep 2022 05:14:48 -0700 (PDT)
X-Gm-Message-State: ACgBeo0r1F5u5ubJH/WRolDzTjguiNB0L1kvKs18B0Q7uqIQ+l12yaRb
	UITSLFNt0QJzpHUXwZeXB2OEO+L60IMZDjGLDyw=
X-Google-Smtp-Source: AA6agR50CvNLGfcPMKXNA+sb9x9y139tPjQL/lKSVj0omRGsWsMk2lFwl6urm19GjYYd6/O/AOii4hTZofsbUxQ9gS0=
X-Received: by 2002:a67:d49e:0:b0:390:dccf:23c8 with SMTP id
 g30-20020a67d49e000000b00390dccf23c8mr11164853vsj.59.1662293687691; Sun, 04
 Sep 2022 05:14:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220826072903.253230-1-ye.xingchen@zte.com.cn>
In-Reply-To: <20220826072903.253230-1-ye.xingchen@zte.com.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 4 Sep 2022 20:14:35 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6cv4Spy2edT3VF47JUo4ew-eCg9h24fh8Bs5ospB68aw@mail.gmail.com>
Message-ID: <CAAhV-H6cv4Spy2edT3VF47JUo4ew-eCg9h24fh8Bs5ospB68aw@mail.gmail.com>
Subject: Re: [PATCH linux-next] LoongArch: mm: Remove the unneeded result variable
To: cgel.zte@gmail.com
Cc: WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	loongarch@lists.linux.dev, ye xingchen <ye.xingchen@zte.com.cn>, 
	Zeal Robot <zealci@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"

Applied to loongarch-fixes, thanks.

Huacai

On Fri, Aug 26, 2022 at 3:29 PM <cgel.zte@gmail.com> wrote:
>
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Return the value pa_to_nid() directly instead of storing it in another
> redundant variable.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  arch/loongarch/mm/init.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> index 7094a68c9b83..f05149aa6a37 100644
> --- a/arch/loongarch/mm/init.c
> +++ b/arch/loongarch/mm/init.c
> @@ -134,10 +134,7 @@ int arch_add_memory(int nid, u64 start, u64 size, struct mhp_params *params)
>  #ifdef CONFIG_NUMA
>  int memory_add_physaddr_to_nid(u64 start)
>  {
> -       int nid;
> -
> -       nid = pa_to_nid(start);
> -       return nid;
> +       return pa_to_nid(start);
>  }
>  EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
>  #endif
> --
> 2.25.1
