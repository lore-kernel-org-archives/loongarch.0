Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059FE3D72
	for <loongarch@lists.linux.dev>; Mon,  6 Feb 2023 22:37:22 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id d7so2963112qvz.3
        for <loongarch@lists.linux.dev>; Mon, 06 Feb 2023 14:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2oBtxwWwjCPYyU17pu3lBwV9dmGFDQEYRoN+Ty55Io=;
        b=gbg0RnDrkEtPW9M9RcaDfqIaD3j5DMKgNppT25xHFz30aj9NTwFnwpbnaOLwXXhlRZ
         QOD2yBmRv+YeFmZkMj+FhGdSwVNXqCmW7skH37un5SuKUUfepwjqwXPCYumStY2RJP1U
         khj85lSeq3MEz8a0hbKrHO77vVv+3IJVswBqBvqaNW5v7961BQ6YJt7njEEoj5xry82G
         KoE7kVMauqpDG7hVLzqhTiqX/punkjXxIZ6ogZ0RIoBCEm7LTq4xvEybh0lsQWrxezF/
         s/gYh+8nSzJWTOnx4yewLISyuXcq+Sy89H36bl0rI5S9xupPWOMaMVVGcS6dYvPPHLpa
         pk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2oBtxwWwjCPYyU17pu3lBwV9dmGFDQEYRoN+Ty55Io=;
        b=5Wx6LIqFlmJvQ2KEiCwcW5y56hz3SbA5IsnNxV8730K0bcSuzjXoSJGzC85K0utiXu
         UXFA5/zgWF4+oAn32K75hWUJVdxZn+rtceBeUIzI00dqe3Vhn761kzJM+Ht+0QBT1caS
         GVqwBKtzCFg2EFldVg+3MTVxYewzmh5ZbMV+iFbxfikvt3ZD14xk9EYczps3fp155Faq
         b8Md8a6JXWUrjTGGdCx6i0seyQSD/swXumuw5pdXitEY9juaNgg0JhfQPOzKUr5QRpvF
         NR3Jqj5z5cfhFi1y1kJlmm5xFq9tbeDj51tCouTQ7Y3SiIrlQAaJnPxkTViMDgxIcL7T
         K/yA==
X-Gm-Message-State: AO0yUKXlr/RmQQ+4AKbEm2+y70JetzRcr3AAPtwiL7mVFupUChc0PWsx
	63EFIVNN5h1ENWeR6MNupPM=
X-Google-Smtp-Source: AK7set/souzQpPd5P9nDBDN5p287ExonEIT5vFztObwMnaHLBbSYhQ0mLbkJiRyT+L9bqtWvcgL78g==
X-Received: by 2002:a05:6214:400e:b0:537:7566:5098 with SMTP id kd14-20020a056214400e00b0053775665098mr1547455qvb.15.1675723041926;
        Mon, 06 Feb 2023 14:37:21 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id b9-20020a05620a270900b0071df8b60681sm8243934qkp.94.2023.02.06.14.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 14:37:21 -0800 (PST)
Message-ID: <7a21e1fe-82ac-6285-ceaf-6450a7ee4325@gmail.com>
Date: Mon, 6 Feb 2023 14:36:51 -0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 11/22] mips/cpu: Mark play_dead() __noreturn
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
References: <cover.1675461757.git.jpoimboe@kernel.org>
 <829d68d289ad4eeac27c5220be695cfa6ace33f4.1675461757.git.jpoimboe@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <829d68d289ad4eeac27c5220be695cfa6ace33f4.1675461757.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/23 14:05, Josh Poimboeuf wrote:
> play_dead() doesn't return.  Annotate it as such.  By extension this
> also makes arch_cpu_idle_dead() noreturn.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

