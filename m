Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D5E3FD4
	for <loongarch@lists.linux.dev>; Sun,  9 Jul 2023 12:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688907368; x=1689512168; i=markus.elfring@web.de;
 bh=d80X359CQ6TRVOivq8e+n8yh+WXThV0qCLG/Vhf3YIk=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=iSSsx25Z3bCqlRR8Fi3UKAfk1uYXomGy27jJCf8h768O2zZI6mZlJ/O1lRo3hCRWEYwk3wJ
 yiKTmyBSpnm4kiQ/SdfcoLXwvrZTs0CiMkJvvCTz9SZOVVGH28gwHy2AyvmL7TDKmUmhgBjQV
 bi6ap3ULpRfyhafRVmJXkHpx7svLNVZAItidMpi/ybLPbL4E13UJ0m2iRlLVg+3PalZPcbD0R
 ZS1C1HF5A+JHv3sLHBEqCawEaO084Wvlk2i5tmw/SGbuLtoQ6hksChXr9eOY1DBPxhmFi/6jT
 Jr9FRIx3wVTPZghG7IUh1Pmx7bFHGc+/ooq3rAFVxU6p9BYOLpSQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLifk-1qa9Ki3BwW-00Hv1E; Sun, 09
 Jul 2023 14:56:08 +0200
Message-ID: <6011256b-f4a9-a410-dc62-cb7a308bf07f@web.de>
Date: Sun, 9 Jul 2023 14:56:07 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: donmor3000@hotmail.com, loongarch@lists.linux.dev,
 kernel-janitors@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, LKML <linux-kernel@vger.kernel.org>
References: <3ddf48d97c90e4203e328180763a0d8124890216.camel@hotmail.com>
Subject: Re: [PATCH] loongarch: Fix broken CONFIG_CMDLINE
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <3ddf48d97c90e4203e328180763a0d8124890216.camel@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Uno5zOiiz/MRNt3Bnsm4iISaF2PeB01IMyS6hl6W6OmAIGwIFw8
 3hT07syjb5quviV1ENUyuz7uYAU8YfFzrvx0j18A7lJ8EFlPFG9zkQpiV+TbtdHjruxnW+9
 VInFxBDWTx7gDqyFYT8AlCcgayLMzoQeNJr1Dv+uSKIgZGQD4Wd6db+BJi7ZK2IASPIeSQ/
 tZh0OOeLO9oT6Qp0q0UgQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tVpbIxlJo18=;q44fjv9qy38DxpoObd7AqmGxD+R
 WVfCSfDowTKv4PnJzwHnJFEOZqQ1JOddrD099IgI43GHAjGO5kEqLWWTW20mWs/KcggrBDMDg
 ww7N6JDIpetIECNL4/19uOVvKM+NNbTozqrnP3vmys1LB/CUfOa039axgkQM/BFaDahPO3ZZP
 1nCLQjieUEj/2BSlo8b2OQsdX6z8JlvPhVrmKI4Szk3MpDLqcyP5bqT/tcROeXlu96icI5n5J
 ckiY0Z0Oxcoj3Qr8/4HoCoDrdmPYiMNlp2HqJy5sv6RpQJRxNs8VMunc4i+1We1uR1hMK9gMx
 kW2zYF47vvvs0kCGWWoHEKFPGDUc919Lcs76r9hAwOYUUY3INi1e9QzgU/kK/fUSCxaE0sNMB
 nj4rLc+bfvA8g07+GMisrUr/zGa6CLAitvF4Rkqpv0PIkefx7M2/A24wVmiAV43QlPwAQKrf8
 iUyBwTndbxhXs9dceqGU7iYH3RAfCLFBieq3Ol8S8WbLp7lqRcg6vfJTkWvQG9o17wPFbDD4Q
 8d+OmzvS2/5XSXtXoLa07tlWdNzFVYywdZ8XV+NrKk1R0QjGrwxv/2UR97utGw4EXTI7yOLae
 cx1CWLzx8xtbVf3SRx6AE+LaTJ5ZUBuJ0SjT2TOPMsDuHcTFPGLkJa88fpM3/sQQqpV0LDLB+
 GhwxTaxS/LqpXhLcxdidHHjg+1Pcbd/xBTns2iADSSWFftCkrUKtjbs2oDfZbsQ8JltH8zxcW
 LxJaQg5CP6kqk9+Rmmng9ZQTSKZCVcRvJA2Pw1DewDzSD3V+xovUtkupPiUiaO/zjlup9xmqB
 ZT8LYEEylxN/bpy81iw4bqWt2lm9YxLheOfCasq+XTsN5EAGI24g0wFHK3IyNkGJ4yRAWIpbC
 tufQBvJ97I21TA9yCXvDmL/xhTe6kIstJBwKBKFjpNaL5Hf3TEd7JHxWl2VmcQ/93OpW95JpJ
 827N2g==

> This patch tends to fix CONFIG_CMDLINE, which is not working with
> CONFIG_CMDLINE_EXTEND or CONFIG_CMDLINE_BOOTLOADER. Some code is absent
> in
> arch/loongarch/kernel/setup.c, which should handle built-in command
> lines
> in CONFIG_CMDLINE. The absence of such code causes CONFIG_CMDLINE not
> working if CONFIG_CMDLINE_EXTEND or CONFIG_CMDLINE_BOOTLOADER is set to
> Y.
=E2=80=A6

Please choose an imperative change suggestion.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.4#n94


> Signed-off-by: donmor <donmor3000@hotmail.com>

Would a more unique real name be more appropriate here?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.4#n411

Regards,
Markus
