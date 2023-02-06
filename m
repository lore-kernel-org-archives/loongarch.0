Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D1B3D72
	for <loongarch@lists.linux.dev>; Mon,  6 Feb 2023 22:36:32 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id x10so7783999qtr.2
        for <loongarch@lists.linux.dev>; Mon, 06 Feb 2023 14:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DY9UghIbQImNpjY3G2+UNsb+fzCnSZLDGPSaq6J2Oe0=;
        b=JRNn2PN7IQA8wrp++7waMCjV2w3MVSBHQy2yaFY5E1eD/qAR5eFFrTUqd7HHZZgOOh
         BKtoIdcfXcvfEkOkPxAPoMpSqz/4LLVV5QTg6sU/i6Ss894Zt1lunVB1YipN7YIy8x0+
         QHb2wW9sDuw07wqO8wKDOF74KYPEloiw8B7aDMqTs/WEYWrqrWe8u2TVT6mCHQjo3ppz
         BtPI49HLyU8i9EE65/3VpD4dZ9wc31UuOfGfWqaEw5Yo34lcugLN63L7bFLGCgoYQWwI
         4GTPN3tXbT1k6DU4Gcw03RgD0rJtIc2M2RiwxziJmhZNdqrRvanB+Br5nnhGtkocLLSf
         9qtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DY9UghIbQImNpjY3G2+UNsb+fzCnSZLDGPSaq6J2Oe0=;
        b=VXymq/deZMMa1OUjvPLgRl9uzh41O7a/I1A6r6+/JYPBNk51vPPwBxqIH+zng+04mW
         UtkEk9mD3HLXHD3lxRPyulfdQKOJ5y/c0oqhYGDfsI9P9bbhntdvK4VhNF3tfbVdJGfR
         uvb/wUjcL0AxP+w2gNZ0s1nl0TRHGcsU6J4ZqMAu9QMpMIDDbOBtZAzO5snjOm5195G7
         DgfmLGPokSCTr/r+JrxKQd/T95Emwj2D6Pqvnp3TjYSLDnMfrSBSs6mkk5kkSQdKw+7G
         RKNoPTUhoabNVtji8gJLSm3+CipXJBMPBIsGjAjYJCqbVyWBVWvzPLdTIlD6yBad2puh
         0IjQ==
X-Gm-Message-State: AO0yUKW+cwJMZYUGgvwDrtDUgKrZsyN9YUudhXXmcnTS4/La20wuV4nb
	gTk7C0gt6unjEIVnQePfSMw=
X-Google-Smtp-Source: AK7set9k2xF1YO2aQZ8CAhnjLiRZSUooGquww3S7+RRW4y3x8DAu2vUxYsVCmwjFnjGnk8wBa2p/ww==
X-Received: by 2002:a05:622a:19a5:b0:3b6:9736:2e9b with SMTP id u37-20020a05622a19a500b003b697362e9bmr1444580qtc.26.1675722991277;
        Mon, 06 Feb 2023 14:36:31 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id d11-20020ac8614b000000b003b856b73e8bsm8147231qtm.16.2023.02.06.14.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 14:36:30 -0800 (PST)
Message-ID: <efaa5dfa-cf00-d68f-2b7c-911b70b4cb5e@gmail.com>
Date: Mon, 6 Feb 2023 14:36:02 -0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 09/22] mips/cpu: Expose play_dead()'s prototype definition
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
 <a532966831383927f5f4fbec0a1e13304588685a.1675461757.git.jpoimboe@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <a532966831383927f5f4fbec0a1e13304588685a.1675461757.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/23 14:05, Josh Poimboeuf wrote:
> Include <asm/smp.h> to make sure play_dead() matches its prototype going
> forward.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

