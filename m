Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BED1C13
	for <loongarch@lists.linux.dev>; Fri,  5 Aug 2022 17:00:29 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 12so3169788pga.1
        for <loongarch@lists.linux.dev>; Fri, 05 Aug 2022 10:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=wnGsrP+ytUGKRn+HBST+F0+IWQ9TRTq4LtQZdPYwsCY=;
        b=WAEBdaakuwSXkSP0CWeTv2+pKoMW9HzIINE+71jbp3s8nhOQFtwx8TP+lZdNnQ00l6
         de4ayiSeib4B+dPF1N0/0HkuVUW6aNnN3x9HRBlJ2iWAWO1lWTELbUau9821t9DZOSRz
         uV4jgogBehGhvQtwJvOV9tPUttZ6TU1rG0029pjMFx5Et1ixrJSRmdHleHEYYaZ1bnpF
         KAfQ47k4Sn+5WMkoBEHZfTNEYncdDsqMWcgPqz9by/npgyT9L+G51SQT4KZ7Q1Tl8aV4
         EhgV620SAqSiVGIM6iv8HjPBVvVnhcFSnhIiZ7HoeGfWQJr8445S2j7eKDXfzdJuY67G
         Y6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=wnGsrP+ytUGKRn+HBST+F0+IWQ9TRTq4LtQZdPYwsCY=;
        b=VEO9b/5mNTRvKWXoNKPzVfFjp1195e6Qg+m2Ozi7xugbVI/HVnQO8RmWviwxGi7uoC
         5ozumUUJUOMFDgYdPEQi1jD7zXJQs0eraTCDe9jgJQSrb5gbGEMIbbCisDaoDCl8xL0Z
         8H6F/j7YhPhderWsHdkBGEAZgGqFzhMPMoxuTyyhAKH/IaAlDx9ctJXCeNNLTxf3/bmb
         Uir0S6/zTrEWKG+kFLsTPIGRkFOgFgddxT/VpMW3TN2gVrnX7HWKxpZ++M4ae/QRDdya
         8G1Q612eKiiisLAm1RWPJEhkV2gEgVZm65XLtoNtrf2bf38ANSvczDn6xV3j+DD7DGrE
         o3lw==
X-Gm-Message-State: ACgBeo1uj4sKcoMdZVEt6K3M6nbptuQ6PfKUKDKyzfn8QFGpgnNYzH5Z
	sF4ExjdQnUbhZ9vQBlvH9Nw=
X-Google-Smtp-Source: AA6agR6S8GJwW4iE0pmGwjw9AHwKF456NuOp5htqnFK7hNqO8bmRDAiOntWpq6W2tPatbtJ/yURkeA==
X-Received: by 2002:a65:6a46:0:b0:41b:65fa:b09e with SMTP id o6-20020a656a46000000b0041b65fab09emr6613109pgu.292.1659718828848;
        Fri, 05 Aug 2022 10:00:28 -0700 (PDT)
Received: from [0.0.0.0] (ec2-13-113-80-70.ap-northeast-1.compute.amazonaws.com. [13.113.80.70])
        by smtp.gmail.com with ESMTPSA id g18-20020aa79f12000000b0052ddaffbcc1sm3358611pfr.30.2022.08.05.10.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 10:00:28 -0700 (PDT)
Message-ID: <9bc1f1f4-3923-be9e-ee13-9c8252a56643@gmail.com>
Date: Sat, 6 Aug 2022 01:00:25 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Please consider Linux 5.20 because it means "I love Linux" in Chinese
 (Re: Linux 5.19)
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAHk-=wgrz5BBk=rCz7W28Fj_o02s0Xi0OEQ3H1uQgOdFvHgx0w@mail.gmail.com>
Cc: loongarch@lists.linux.dev, linux-next@vger.kernel.org
From: Zhang Boyang <zhangboyang.id@gmail.com>
In-Reply-To: <CAHk-=wgrz5BBk=rCz7W28Fj_o02s0Xi0OEQ3H1uQgOdFvHgx0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2022/8/1 05:43, Linus Torvalds wrote:
> (*) I'll likely call it 6.0 since I'm starting to worry about getting
> confused by big numbers again.

Could you please consider use 5.20 as next version number instead of 
6.0? "5.20" is a wordplay number in Chinese, which means "I love you". 
Thus "Linux 5.20" can be read as "I love Linux" in Chinese. So I think 
it's good thing to release something like "Linux 5.20 I love linux 
edition", just like "Linux For Workgroups 3.11" in the past.

Best Regards,
Zhang Boyang
