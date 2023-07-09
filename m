Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ACA79DE
	for <loongarch@lists.linux.dev>; Sun,  9 Jul 2023 18:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688926385; x=1689531185; i=markus.elfring@web.de;
 bh=y0E6xhBz64itHSeGzLGsNiXOkdDpNEO7RfR9bqjCwRY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=XsXpKitaKm+aQec94AC2AraUvZjIDfWCHJCGuwaerPgVsXlvZ5d2Hm6YUXLkjxLYxP4pxB3
 m4XeTr2V1nvQrk9i6CVHO9DcLjgjyZBGokYp/94b6ZCsvrbRigbIUDUCPGr1MWz7KnORyffmz
 /55NAg7Xgrz0LkVSzyQ0KlnT9LAavEpugCcCOeBMGbbJ9aF612kfALCKflSnfsflc8elZFmcm
 6df7QWJuV2i/ogQ0BmYHUcUUF9qn8KQUdNRHcnj24Cutw6Ipau6bWJm/OrIdrKVLutDubPvZY
 TYAVSx3EtkT+soyHInjsRABdcQHaEv7+XcU/ocqenV94/ETE4HvA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MNfYN-1qbzjO2KL5-00OnfT; Sun, 09
 Jul 2023 20:13:05 +0200
Message-ID: <fb5bd2d8-5a65-9687-8dff-cccd28e136c6@web.de>
Date: Sun, 9 Jul 2023 20:13:02 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: loongarch: Make CONFIG_CMDLINE work with CONFIG_CMDLINE_EXTEND
 and CONFIG_CMDLINE_BOOTLOADER
Content-Language: en-GB
To: Dong Zhihong <donmor3000@hotmail.com>, loongarch@lists.linux.dev,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Wang Xuerui <kernel@xen0n.name>, Youling Tang <tangyouling@loongson.cn>
References: <MEYP282MB2597CD6E861D659E3218148DD933A@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
 <380911b1-13b0-2c69-7adf-f40abb604c6c@web.de>
 <93faf53150732ac776e68e34709a9aa8c88b5944.camel@hotmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <93faf53150732ac776e68e34709a9aa8c88b5944.camel@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Wa+c3TJRAoPTf8jNCojyDZ0/FsMyzz0h5wbzgfIlbBvuZDKoc1Q
 pYjos65A+Plc+JUG1eqIIFdAtqXGllkxOZjACxe9r87hSzd+5lD1IXJepxxcLP85J1ieYGY
 q8IkiqGF7O5u5huBLSYiJwVDlS0ltuKOps2NTQtXKZYyacXW4EPan5Zpezm1ENU0DpEY5vj
 dRSDogTr0ombVv+wQI+Bg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nvG7XtV/ed8=;LS1GkNSsyEfc9bUeN4SrLxF6Pod
 r9ZJWv7g+q2nojtT6pa0RkMl5ryJyZrLUp4J3yo6WbJzw/921cUGnh6yE1qn3C35geW0GSUbv
 RpyPFZaAjJiH1bOk7XyYuSsciIamct5b+y1B+2gc/BA3FpMoTIoWruqADLFqM46k6nCV5vkg7
 4T1MZdeeIcaPNAztYQ1opcLUpt6OxFvGOmKPBQ9mLG3nv/u9Zg62AwL8oT00OXoek+0saaRoH
 drNneXkdnfefcOhfaK/q5LiUPllySLJaAytwWQ8otFPXDCaB8UJambH82dBmlKE4qge2PNdW+
 HuUOGHmgUk5Vha7j9UT+OI5kHUnofq2zSORpGlzMpFIJ+22IGtySMZawAUlu5yKrH3ptUOJRv
 pWwySbkPUeyzDNG6nINMXJF1y7C1pRQ+RtSIuNUJ05s5MlJyFn1AynfAUgEn87MqKZEnMRhMU
 F9cBsdSKsKWsTTYYsy7aP+l9bTkQlms0gavTDpm4yuFwS8mALNTXPy+pT9FOzSRudg+AN7O1Y
 HAxVGOtmDpEcFzrZhrMsNKyz9Uos/hECtjPPPhF9fc3fimUlBVR05nCMmQtA6Ls+dZ0jrLsho
 NGUuR4K4F0FaPkWWTgC2y2pSF5L8naU5D4x1KGVD5MaMTTLx53MlFXVy7LWJG+S3pP5DC5Bwb
 sbbLWBFEw38gss5SNxAAkzlh4YpWfojQOd8M0/4IS+tN8PBKgCcWhXYlfMraYuimsSckif2rg
 sWLOQQSC5DBe2p2CAY1+dvNckxG4PN9ZaCDho4oGBUTywlO6ti4o8xZ6Tg+C7uwcaboXIZH2V
 7ktgNWL6RXMVW54YwdsVH+3LVed0RQH0G3fR2JBuJMNEMz0YOfblLSX0tyKmM3YmcCXSJLNk/
 BhJERjMxnjUA6TlBkO6LMVVcVfs8XDdjRHqiBnDyO8BHAX7VjmYA38SyE7X3OzPY6zc2pm/8P
 l5+/XzDbs67GxJOavDnLuj/ahUY=

> Also, a feature shown in config should be functioning,

We may hope so.


> or be considered buggy

This can happen.


> and get fixed.

Such an action can occasionally become desirable.

Under which circumstances would you get into the mood to enhance descriptions
another bit (also according to the published Linux development requirements)
for the presented change possibilities?

Regards,
Markus
