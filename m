Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5C54C7B
	for <loongarch@lists.linux.dev>; Thu,  2 Mar 2023 10:55:08 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id f11so4181749wrv.8
        for <loongarch@lists.linux.dev>; Thu, 02 Mar 2023 02:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677754506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0kjxBm4+DoG4C2wkKxFrUZYN+G/AbIQR/qTtaSDrIN0=;
        b=OltRJZx0wGBWq11qdaiOynKDK4Zovlj1Cqp67B71vJ4hfuI2sFXjgoUuVEU2kyKkgm
         D1O70YbsKsxsUeP4307Q9vwwD+JkLHels1coONwCgRjrOWy0WyMnwJdQelpTzsY6Y9bC
         coAn2teeexMAaYv/5ih5qMtH+mbgaYpgEQMR/zTnYTbe3Ol/8EwpGdq9+F5V7QjRCXg0
         qufSooKI4b9bM118gEgXEklxl6NfI/fpE30hSjmZYQkuu+WVYKy/dTVk25R3Gi2RS7yX
         dbH8hvvumvlM+GzPFdNOQIYGdoNKHPSgIVUL4cWn5ml2/2Oa3rz+bNrJXmAv31lgBQIV
         gepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677754506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0kjxBm4+DoG4C2wkKxFrUZYN+G/AbIQR/qTtaSDrIN0=;
        b=dbhFwY5BREsz0c+yZnLFEttqNz2sHeAAUlW1soe+8g1hA3TRWM/XMlAUikEUtp0viH
         XRx9QnxigqQov9T4MsA/TojtA1a8fhWH6/+lx1V7hvK1vsRiBguBtzl9zsm0AWXQSy7A
         qohnW65Ra+D8aAPoHQVYXofk3xT59Fz7/dbRbPSzfOIcW6k1P3G4UkmzX6SsKsXGTm2e
         dfRr2La3Vc1sOw2KQys1DsOINN2WmuTvyKAwkYZwnQHc4yBFgPRkgHVIEx/IrZPIlsox
         MscL6iUTd1cebh4xSwqfx9X6CVIVCJ+RMCawe7gwXbOA8CiMd5N/n3dWIRr73Ggtrj4K
         fDzw==
X-Gm-Message-State: AO0yUKXqgGC1ei6g+Lh0cFavKgT0IBxkuOF/DG1WPduP+C8brncedmCX
	eNSyjMMFPdTeINX4ybY7MAWAuA==
X-Google-Smtp-Source: AK7set9yfancJC9F/8+0XfOWQfqS1+KlikHyR2NYbUWgAu3Rsx3a/IRK/+MfzAe0tCHzWfXDpMcIqA==
X-Received: by 2002:a5d:6b10:0:b0:2c5:55cf:b1ab with SMTP id v16-20020a5d6b10000000b002c555cfb1abmr7109270wrw.48.1677754506664;
        Thu, 02 Mar 2023 02:55:06 -0800 (PST)
Received: from [192.168.74.175] (89.red-88-28-21.dynamicip.rima-tde.net. [88.28.21.89])
        by smtp.gmail.com with ESMTPSA id k28-20020a5d525c000000b002c556a4f1casm14839206wrc.42.2023.03.02.02.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 02:55:06 -0800 (PST)
Message-ID: <ecb9af84-a2a5-1414-13ea-be00e9203da3@linaro.org>
Date: Thu, 2 Mar 2023 11:54:58 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2.1 09/24] mips/cpu: Expose play_dead()'s prototype
 definition
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org, jgross@suse.com,
 richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 linux-alpha@vger.kernel.org, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de,
 linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org,
 linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 chris@zankel.net, jcmvbkbc@gmail.com, linux-xtensa@linux-xtensa.org,
 peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, paulmck@kernel.org
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <39835bc75af2e812fce56400533cb2ab41bcf0e2.1676358308.git.jpoimboe@kernel.org>
 <080a5ccb-7fa0-1a75-538f-a09dc146fc4e@linaro.org>
 <20230214181101.3a2tscbmwdnwbqpu@treble>
 <c56dc4b9-035d-7773-ecb2-0e1ac6af7abc@linaro.org>
 <20230216184249.ogaqsaykottpxtcb@treble>
 <20230301181639.ajqdeh7g3m3fpqhk@treble>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230301181639.ajqdeh7g3m3fpqhk@treble>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/3/23 19:16, Josh Poimboeuf wrote:

> The latest version of this patch triggered a new kbuild warning which is
> fixed by the below patch.  If there are no objections I'll bundle it in
> with the rest of the set for merging.
> 
> ---8<---
> 
> Subject: [PATCH] mips/smp: Add CONFIG_SMP guard for raw_smp_processor_id()
> Content-type: text/plain
> 
> Without CONFIG_SMP, raw_smp_processor_id() is not expected to be defined
> by the arch.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202302220755.HM8J8GOR-lkp@intel.com/
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/mips/include/asm/smp.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
> index 4eee29b7845c..cf992b8b1e46 100644
> --- a/arch/mips/include/asm/smp.h
> +++ b/arch/mips/include/asm/smp.h
> @@ -25,6 +25,7 @@ extern cpumask_t cpu_sibling_map[];
>   extern cpumask_t cpu_core_map[];
>   extern cpumask_t cpu_foreign_map[];
>   
> +#ifdef CONFIG_SMP
>   static inline int raw_smp_processor_id(void)
>   {
>   #if defined(__VDSO__)
> @@ -36,6 +37,7 @@ static inline int raw_smp_processor_id(void)
>   #endif
>   }
>   #define raw_smp_processor_id raw_smp_processor_id
> +#endif
>   
>   /* Map from cpu id to sequential logical cpu number.  This will only
>      not be idempotent when cpus failed to come on-line.	*/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

