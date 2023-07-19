Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5686E5242
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 06:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689749475; x=1690354275; i=markus.elfring@web.de;
 bh=Zj/4fnwOYxO681p+UqTci2/8ZIxX99pGEuDKgYoN9wI=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=O9MgFkh+r92CR8cidqcRCX1rJ5LatpsE52iM4zVlyQp07svyvl+OxHjMDU/KhNjPMnjLw/0
 VYPj67Txe6rCQp2eF8h8S6pCoyKBScZE/b1+y8AGrFfqyo4AbNwTwpfE8RKxBPXg5AuRSJrBe
 Cqh5LgJEmSJhgK2QUzllY83QRQpZgqJHU1ZpMYJsip+ONiZV8EhJ6ufQ3AWuRPx4nfpmA4P+3
 0QeqEZ668Hf/gX2fXk5isAVlTlsowTPliLup5S3SWybFYXlaPOgyBDpRrfpP2zx/+QbsB+SKR
 XGPCk010BJKkEcktnWh6NJbDcPLOfnWWSd7Kk9ySiydNTdfFZS3w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N6K1l-1pt8F13nsv-016U1E; Wed, 19
 Jul 2023 08:51:14 +0200
Message-ID: <261edc6c-e339-faeb-3045-bfe6604d1aef@web.de>
Date: Wed, 19 Jul 2023 08:51:14 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Huacai Chen <chenhuacai@kernel.org>, Zhihong Dong
 <donmor3000@hotmail.com>, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Guo Ren <guoren@kernel.org>,
 Huacai Chen <chenhuacai@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>
References: <20230718153348.3340811-1-chenhuacai@loongson.cn>
Subject: Re: [PATCH v5] LoongArch: Fix CONFIG_CMDLINE_EXTEND and
 CONFIG_CMDLINE_BOOTLOADER handling
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230718153348.3340811-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cyiPGW+dg0AzjQVWEwAMwycX8JX+HfUeoBoa3FyIXchOeMKa7c7
 Tr1rblICfio9OOaRKJ9SnK2dRNMBs63zpjMK8W0Zi9uIfhvIkF3o26/XCtGifJtjnAh3lI2
 hBjPu2whMzr9aoMIfqWqvaeLm1NoFllMgksxG2ozLq/RCbY3ZP2xHJWC5Ppn2EwLTHWZwMe
 da4xmroYmgowfXN7amrKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IZLF/M87UL0=;Wx1wzd+UVUjbZ74JuhcvkJeEdIa
 /sQp/ygL6qO0YvZI2bNJ+rClLLhLs27NXhHbwDcYNBIR1TkPaVyUum90RjBt9hnRez739ev50
 DG3NiwQfhnf8nWXRflpOKsWtSfy6rXi6iQvbzthp/C3COBQPRN59K5k+FKhGDueZUyD/A4gKo
 a4lkrtdMVd+6p7j4oCeGkprX/w07mcY0J4acdppX05/UGiOtN+HdaFu5ASUKhDGShnidRgU0p
 Qr25SmswIjPJ8az72jD+fwAZg15zIGHjs+a3G8mDrQb7icWCKpQEdGti/dPXim7qQUJXBcx3K
 l7XTbMK9p1MgIh8TXuiFKn3o9Bys8p0unU0Do3zTSSy1mIt0Q6YrmtIQGEIHe3L9SlSLYiy1x
 bMYT5INHuguuAXjS4wlI+CY7/zBGZfGem7U2lRXXP3dos7EhJrMXazMxB3RrEaqrCfUt6OG4E
 +f65jW2pzo+lEyUVlr+GHjsKyzJr5Cqjvexs2yDl1M8H9QTRuFoqWPX1Pwds9pVo4SLTjdzcN
 xcl6A+CKhyESMA5F2GeBhazdWL3qr1zuhllt8YGExJ51m3T+6LZQFQL6eGJ1E4Nh4FsfxCmnJ
 Cw3Qk7zIFdEWShlAZtuvEEvxdRETUON9B9Pf6DsWN4vRpB7/F21jlccdnks1meQ89fafG8KOQ
 etzHluOtrqODsKQhMcZLLpIOlG0roKf0LTzMHsyy5j8yetdfdHIswE7UWGsiv/AB70piYOR5e
 ftpEgrwtpmr+iflEHj1skO0xid+dLqkLOMhGarqnLiNJBKlANDqILMiooOEC9fWWj3/JumHag
 MlygXkU/qR68MbU7FOAKqrmyNuPKFk7srD+W+EiD+8zd0rvESBS1EdrtfnkLy0MKYJZNWt9PP
 8DUnUmmSWLutNh+qlg2aVl7XuFEkuI0tAFY2ZRIQ6Srwzzo9wHv1oF4z2yT3+vcNXQ/lkvY1W
 rGLXcTT+lsW9k/VwFezcWuB0wAo=

>                                                   =E2=80=A6, so this pat=
ch add
> some code to fix it.

Would you like to avoid a typo here?

Will any other imperative change description variant become more helpful?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.5-rc2#n94

Regards,
Markus
