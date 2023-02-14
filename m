Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3823C02
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 07:50:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so689827wms.0
        for <loongarch@lists.linux.dev>; Mon, 13 Feb 2023 23:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFkW6VXT2fJOMq6WUaQRBhQCIVLvw3497deAs8udnhc=;
        b=b2BkfvRtFc9qhL9RxXaUQvxTUsLUpsHLXh8vIrxL+M+JiOUhz32HAYvSUPPyTdQl77
         1p3HUUIWnP0wozCAjwY8VxpC5Hjl2+v3GwjG/dFVysmWZhGHWvr/6iIH91gfRtudx5ii
         egD42T62aSSeAUQAoZ3bftvq6oEk1IvgPTqvhyz2/H8/FloRkK5BRF9A8eWltvJmLwJI
         Uf0s9r16yQhJARquCcxwXlLrVW3jKQORB/2Pnub6HP1P/jj2kw2BN2QNr8FaScNfp7xd
         Jpk95lFXnJ80tAWYVStTx2EDtvvDFldUhYT6kDqrJVlji1UtQ+TxVDywjsr26yaPckWo
         FVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFkW6VXT2fJOMq6WUaQRBhQCIVLvw3497deAs8udnhc=;
        b=GnhXdR9o5hYMOvgl7dTWZYx1bZ89eRs2Pi5vIcyANBJZoYtWArA6onkrbKmYlBCUAz
         vTfa93hBru9MxQwwik51IkaYrq2aZUuoCOO1BPvymEOjjXXGBcggtJAK9EJ5CvHJcQjs
         z/4tnAYeXz5g4uKUQnZEQNhT9vr/LhjX3H9ep5EuzvQ0Dp7dVOpx0WF+wcXlIADeFm+6
         RkxDkI355XhpBBWUJ7z4CQ9ify2XEBjhovLQyx1dQ8agqhFXrmE1bYteluUCgrTEiBvN
         Nl3j7KWFmKpzNdi122SUw2VsC2Qy2+h6ndqp3z18b1IVxMiR7cW2Du10O4U0OXicp6xD
         uqFw==
X-Gm-Message-State: AO0yUKVUj4IuPafxhJeWt5rN49frixApp8sffgZ++4T0UfQdNGqdM4n8
	Ddt8SHpzkoui9DTUDwEd03P+2A==
X-Google-Smtp-Source: AK7set8OwsFg75MOvBTEy09aU+PMdliA4+gMU5XeiDY9OERUz4XXU+M2RI99OwrD6TCFxsze20SfqA==
X-Received: by 2002:a05:600c:1609:b0:3df:f85a:472f with SMTP id m9-20020a05600c160900b003dff85a472fmr1835747wmn.13.1676361054982;
        Mon, 13 Feb 2023 23:50:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id bg23-20020a05600c3c9700b003dd1bd66e0dsm18073301wmb.3.2023.02.13.23.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 23:50:54 -0800 (PST)
Message-ID: <56249307-5093-1283-d2db-26c5b20881fa@linaro.org>
Date: Tue, 14 Feb 2023 08:50:51 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 11/24] mips/cpu: Mark play_dead() __noreturn
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
 <2897b51a9b8beb5b594fe66fb1d3a479ddd2a0e2.1676358308.git.jpoimboe@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2897b51a9b8beb5b594fe66fb1d3a479ddd2a0e2.1676358308.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/2/23 08:05, Josh Poimboeuf wrote:
> play_dead() doesn't return.  Annotate it as such.  By extension this
> also makes arch_cpu_idle_dead() noreturn.
> 
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/mips/include/asm/smp.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


