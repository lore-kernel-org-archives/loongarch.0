Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05AE3C02
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 08:07:07 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id r2so14707398wrv.7
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 00:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ciz48yn0bC9pSOawr6J2EVonTfRljnaqRRwbx5UW/W0=;
        b=TIQ23jpnzQarzd1RIe9VRIRAG/Spi2nIIoQJ/TneQakxj6QFyv7ubfVNIbXnkNccLI
         9YHADgP0ZcuahSTpp0itHxB0vnxid9R3STW2gWzzjJJRY3KVMZwyjGmKniKDMGXJnD/6
         hDCyLOAQegB/dwr9q127CSBA2/hqxOG01KsSqmOE86OrEQspfFq+Z3AKGUE1cclZrXkJ
         f+EqgIFwlzxpbPLrsLQTru1Q/+CAIVzIK+aLJtFBqFOqcw6/nRciSXI/ohQrTMnNTXcW
         9hI2Cm3He0kpAaFodIU30P6FToJ/AvzSfa+UmY2I7DpLnZCKW3ePhquo9Mo0AfQ0lt9E
         DdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ciz48yn0bC9pSOawr6J2EVonTfRljnaqRRwbx5UW/W0=;
        b=rxg3Lnuxu2094r/KvnBHZXsuf6ci34H/cwAc0il+DHq3R6FeaTSEK3MMV/eVYUv/JH
         Me2O6XaonNpo+WIQBhd3PKRNuHRp6q2GvNB6ZCfwI570CS/BPvGQiaWfIOubCniep5Pe
         i70PcuPnFjeXIO+rLMIVQqw7YObDloF6e2Zh0r9k8HEF4cHURl9SoN1UVVGmmNkAeD5L
         TNohPHfpkX6T8R6X7F3UvbeZYAiisMU/ZOoVaygsiP5supKFOfq/Or8UBaiv2IWZtlfs
         r/J12CU12Ij9lIL+yu/6He8JnOyy5Q7Lwo9pDywZ58eImibpBJxvn7vo7KmjuZinp4BT
         pIyw==
X-Gm-Message-State: AO0yUKUKk1se0IqvB5FfQPQu/y8QdrH/M7KPZr7XrWxFjw4cwDVCgiOx
	S7erLfN1bSEisDNOSy4nME9MGw==
X-Google-Smtp-Source: AK7set/qu7AARZd3PE61K+4RewTMhIGOBtMo65cTnHm+ATiqbV6nbjgYgV5TQbegZ2uwdy9X7E8sUQ==
X-Received: by 2002:adf:e54e:0:b0:2bf:c09a:c60e with SMTP id z14-20020adfe54e000000b002bfc09ac60emr1274577wrm.2.1676362026121;
        Tue, 14 Feb 2023 00:07:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d514d000000b002c3f50228afsm12138404wrt.3.2023.02.14.00.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:07:05 -0800 (PST)
Message-ID: <6c4fc38a-ba24-fff8-7bdd-b633a79200db@linaro.org>
Date: Tue, 14 Feb 2023 09:07:02 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 06/24] ia64/cpu: Mark play_dead() __noreturn
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru,
 mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk,
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
 <7575bb38417bd8bcb5be980443f99cab29319342.1676358308.git.jpoimboe@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <7575bb38417bd8bcb5be980443f99cab29319342.1676358308.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/2/23 08:05, Josh Poimboeuf wrote:
> play_dead() doesn't return.  Annotate it as such.  By extension this
> also makes arch_cpu_idle_dead() noreturn.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/ia64/kernel/process.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

