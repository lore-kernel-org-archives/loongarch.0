Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759EF3D78
	for <loongarch@lists.linux.dev>; Fri, 21 Jul 2023 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689935859; x=1690540659; i=markus.elfring@web.de;
 bh=nETbZNkW2UeKwCzrV/muEGWDHTMFY3L9Pv2JULzOo1Y=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=cru+pI/H+Nl77t0ztRjNcN9O4+TfwldjhVWj/SnNT9yxJyLBNSPd5gGXXGJ/iS/5iOwv2HY
 eCAIn4rAjwAvoTkf8Wt/7zv0ofXHyFzgW+tdBgCapTXtOxhGGRNzk6vBuPmUJWmyH3FR8TwxF
 oNJRnx0QV6rsN/X6sngEjAGUl6IJhxbsmgqJc/zTOr/TWa7VUD0va6M8DihMo/lkjniAtWMXG
 knHVLwcC9VmzFv+Ezl+RVPZBLkpblKJ9SMSu3HZ2tZr0aHrKyNzGQ0LazoQ2Uzv7Jj00ojYWv
 WRV2qaKUfXTObLuDMBVdMYHOhBI6GOR5H6rprmRHRsY/bNIangUg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N4621-1pwm8Y3LNJ-00ztDZ; Fri, 21
 Jul 2023 12:37:39 +0200
Message-ID: <dc47d6a7-b0d6-9497-db95-f5c4fb331a15@web.de>
Date: Fri, 21 Jul 2023 12:37:28 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Dong Zhihong <donmor3000@hotmail.com>, loongarch@lists.linux.dev,
 kernel-janitors@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Wang Xuerui <kernel@xen0n.name>, Youling Tang <tangyouling@loongson.cn>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <MEYP282MB2597CE76DFC2B421C1A4594CD93EA@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v6] LoongArch: Fix CONFIG_CMDLINE_EXTEND and
 CONFIG_CMDLINE_BOOTLOADER on non-FDT systems
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <MEYP282MB2597CE76DFC2B421C1A4594CD93EA@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xsB1ihtbSX9m9Uvcy4/YgkOzblRhWP2gNSPTYmMx6vIXgAZCqTl
 s2ktzH4x5M6UqEhCP0ObmSBbErbvApOwjcA+EO9Vc+r17Pu4TXLKNXkxM8/sdqNwVyYgAod
 fR5ot3VaIVPdJi5sW3gx0asqxSmk4TkihnDAQ4w0BJHwZOs1Zy/X7sSCLBekW18zkkNOzmB
 Dg+8oVsnUWEm369m5gJbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PeGV99X4igU=;sK29NYy9G1eu4C/wUmR082lD8li
 jmFF6tbKdcHj1oDdiyyCR/Rgh/OST7zJbhKWZFU4Ayp0eDB9jKzzw4KPczffghpyBQksmuRFm
 lxApUd1V47Z4a4/1Eee1Cgqtxxp+TfJ6DmlxI4KQWgv4oX+3gvOWHXGXfpo4qHoCEw/f619j7
 xSIdyY6e8dMfsm/Ywgino8vxABH7+OIVaaIBTIogfCrIWwDtf87F6/6otZmsea/6fiG3AEhFI
 aPY9pPW4k4Hn1lux/og6Zj/KzWfts7zKIxC/HPOgWtx/ms9wL7abp9HN9eyjqOaUEqQNSPLyj
 Pb2qFmBZOW8k/1NZP3nEwCxHgv+dEveZCDssRwmQa4st/VoRkPbt7/VTWFc5i1gzyln5/9mjB
 JaqJLKKdCMI0rr1Pj0ceRN+K31y9Oa822t6olojqsJnNCZezoa0CZFVBuFFLgrUBTSEhajZgO
 CHIQRndSraCq/5Nsm+iVzMJKkDiTsixrwW5ZGncGh6VkS681ompr2HoME8lDT7DZX7Vxq5WUP
 bGLm4zu4rFKaSrdptAlMq6glIzbU59rgaRGht3n/+5Onbs9gk2IDUxMUaJApSYRpb5wxKMhTe
 6SC9YHs29MwOSki9FvI5ukvTd7GiErgmj8QNt/FryP7H8Ve/yiGS9VdwHNvE4OEFiVtRl51Zn
 pbsvUvVnpx930yZag4TxS1tmNEZwC1b6fU7rBXY1O0NteAn9yoWnzSxBsiknzmLbqyraZC273
 HYsLRg3Dh0lITbhohLWjcX/IzCcqW3yMmreCASdmJ8HeXDGVLErBXhL+9PuyPz42Y0ajCLd4M
 cZ8wk8IzRh7jIAog9bRFt6WsRkKGnut6mzoEmZx3cFkl0C22bjHxvu9KFU4Ril/7AoyfB81Jh
 RQljacJ9/rKeKlbjsKgZLk07dSdiB4Nhql3CuQtNAsNQgfOabnfBW4XZHZykQKO+mKatIvkqJ
 xAIzfg==

> On FDT systems these command line processing are already taken care of
=E2=80=A6

Does this description approach contain still another wording weakness?

Regards,
Markus
