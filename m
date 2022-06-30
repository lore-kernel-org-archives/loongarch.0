Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCC7EA4
	for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022 08:30:26 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id s10so22096028ljh.12
        for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022 01:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=exmVtkdf8iqgf+gOqcF+l5gdtLPh1ijzYFebTBvenf8=;
        b=iIfgXcbDYzBCNemnPd7OR/J0GCHgV9UhPZas7D867L/xdrSGxbTwdGB/OUmDtgc5wI
         cdV9GdHKvjjEVA6/BbIGYnZdxtBBwAKhxbaNNiFuNGmTs/W3wDbOcu1sFECLZlXxMbfE
         sqq7Sr4zEQ2C3rMgvj278IOaNI3ByI5HMKqqtqm/KaOZ9VO6/XNMd4IzRTw+mKgYioDI
         OSb+YdXDV9KVToVhKhC06CoswXafYzXt5zzP1Rqt8rlJnmzAo74a9t30tErQO+QCyZsV
         hoIsMKsphgtNOL32sBbDsqMD6s7Zc4074dE8dItBbxuSwXLrKQj2aBbHpJxEMCDG58oo
         JGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=exmVtkdf8iqgf+gOqcF+l5gdtLPh1ijzYFebTBvenf8=;
        b=iAkL1DcXmDPvpBeje+plmycjVPDNJ6cytKMWzPKr6v+neAH81tCYy1YqA91sU6joW6
         TNIRnUovLDOgGAp3Kd6eaCk7gp+cze1MZLI0fqKNOK7mSwUUGqFrIdsTCgLJIJipKxOw
         g0XbDG/364NP512f7DUeuY91jhilFjAUNtmQWS6PdlrLfr7SeHfIRJ0JKlUElM9vLMCn
         On0b7YH2DrWGYmw5qOJAxLguFIiZyTCgTwaBzo8ymviHDaRoWNsCpMmWqBoxCP3ILpgW
         kKpHW1D26raYErT4SF+TnBAecd+PQFunWAIxgVFYDVDEsyfIi2GoZx3f5AsW6benT173
         q23Q==
X-Gm-Message-State: AJIora8GB31R6JOg8KuzBibf1p0z0EKsCF2SEj+tnI0DZgAZ5ZvZB30P
	rAsrEhBEjW/e/GTPtcm4S2w=
X-Google-Smtp-Source: AGRyM1vJL4x2WNhVF1KGjsBh44FWHPxqfSk7oVIEYhpdoi2ad8mJHiF7l2JKr1zIoHq+hus83xoErg==
X-Received: by 2002:a2e:9dc3:0:b0:25a:76e0:ce18 with SMTP id x3-20020a2e9dc3000000b0025a76e0ce18mr4393880ljj.451.1656577824153;
        Thu, 30 Jun 2022 01:30:24 -0700 (PDT)
Received: from [192.168.1.103] ([31.173.87.62])
        by smtp.gmail.com with ESMTPSA id 13-20020a2eb94d000000b0025a69b43f49sm2484886ljs.21.2022.06.30.01.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 01:30:23 -0700 (PDT)
Subject: Re: [PATCH V2 0/4] mm/sparse-vmemmap: Generalise helpers and enable
 for
To: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>
References: <20220630043237.2059576-1-chenhuacai@loongson.cn>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <35094088-d5da-cd36-66e2-5117304c5712@gmail.com>
Date: Thu, 30 Jun 2022 11:30:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220630043237.2059576-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello!

   Your subject looks unfinished...

MBR, Sergey
