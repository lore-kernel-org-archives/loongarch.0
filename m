Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4515F2E0F6
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 10:59:10 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f764e92931so736313e87.2
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 03:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686913148; x=1689505148;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dUWCxuHQ8in5DxE2T0YCH5bwAXst66aM81pUfth5QkM=;
        b=fz8zCd5w8W6aAZ+vJQ7uwA8T3b6dQH2EaG6ukoYeiQGvCILCxDCNVt+nRMeMar9a5p
         V6YeuitHvCXWxWgH1hldRyV1GgBQphnJznkVx8zuicOpR7pVzJLRlAHWPkzV5t3QrQXG
         ln4XCHrGSU5NfXHOoGo37yNYyz13XUqsGLYqYiTOjit9Cw3JLTbaVrFY5ZK1SWwtLXAh
         cZgl5qxN8PL1glHOyAQVBnKs5H2iu2R+UjffVIAwfXjH2B+kGLxq0sTzzyj7I/gFUxKj
         H9Ztl0+DCT9lWglC5npWWORzuO16o20XLuN8AR2y+DLsYaxhwdoGGoSV1YOhhJm2g+iI
         8gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686913148; x=1689505148;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUWCxuHQ8in5DxE2T0YCH5bwAXst66aM81pUfth5QkM=;
        b=h09aR9/51QgtHXJ8j5+q8szW8j/d65QoBIy0lv0ywrgW24o7DOnkChmVS6cv3ZKgpC
         OAJCmy6ykhkUlJdnVUOWpHbSy1q2akENsMP0JGXi2wwDv7xjMrGb4OJT0n8T4E/FpXmB
         i8yGc1xDU+sc/csW1BNn2IhbkGzxN5cHyzsBqfPbHBjUJSDtYcXdubH+yhNPKaIyxFLC
         qR5D4iBD+oJlkQYJ11wHDxwbKDb/3xRRjespzUbOVsLUjFAio36rvKScZsDKqYxJEg8C
         pMGNarRIpPEVwNvy5dehAImdwnF5b5iECmOKOKPGMC2wsb8EUgPQDoiKFm78jy4ESzQA
         8vIQ==
X-Gm-Message-State: AC+VfDxncR6NBqzXXCOY+Uuc3AwHAODP0aKapgHLTELxwfYqiCvsEqTP
	h7bZ5cwWiQN7f94WsC3ewB8=
X-Google-Smtp-Source: ACHHUZ6kOEnIBIg2UJAOJAWbU63kq1NhzKdzBsq1h9lx/I7J6dicurWwVVj1+Nb2b6TuNuoulJMefA==
X-Received: by 2002:a19:e019:0:b0:4f6:ab8:bc12 with SMTP id x25-20020a19e019000000b004f60ab8bc12mr1358190lfg.20.1686913147774;
        Fri, 16 Jun 2023 03:59:07 -0700 (PDT)
Received: from ?IPV6:2a0b:6204:4302:5f00:f401:444b:6444:44af? ([2a0b:6204:4302:5f00:f401:444b:6444:44af])
        by smtp.gmail.com with ESMTPSA id d24-20020ac25458000000b004f8424ed05esm704884lfn.63.2023.06.16.03.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 03:59:07 -0700 (PDT)
From: "bibo, mao" <bibo.mao@gmail.com>
X-Google-Original-From: "bibo, mao" <maobibo@loongson.cn>
Message-ID: <8e310bd1-1fbc-36f7-7abc-5553fc20a85d@loongson.cn>
Date: Fri, 16 Jun 2023 18:59:02 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4] PCI: Align pci memory space base address with page
 size
To: Will Deacon <will@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20230609022047.2195689-1-maobibo@loongson.cn>
 <20230616093116.GA10423@willie-the-truck>
In-Reply-To: <20230616093116.GA10423@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2023/6/16 17:31, Will Deacon 写道:
> On Fri, Jun 09, 2023 at 10:20:47AM +0800, Bibo Mao wrote:
>> Some PCI devices have only 4K memory space size, it is normal in general
>> machines and aligned with page size. However some architectures which
>> support different page size, default page size on LoongArch is 16K, and
>> ARM64 supports page size varying from 4K to 64K.
> 
> Shouldn't we also select this new Kconfig option on arm64 then?
OK, will add this option on arm64 also in next version.

Regards
Bibo, Mao

> 
> Will
