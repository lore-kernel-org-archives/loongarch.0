Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A074699
	for <loongarch@lists.linux.dev>; Sun,  9 Jul 2023 15:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688917394; x=1689522194; i=markus.elfring@web.de;
 bh=Er+zdwku4zb+ZfMsXiz013qC+eqZo8BoBVNpyaPONc0=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=MP3TdMDQf3mwFjWVnWzN00grGUdFGFFd6+VRvESnutS9HqUBpaGE7QebQ4aSgW/m7T7rYNN
 z/8hwV+9GqroxTRMKXgXezDqxzWqoXCqj3wAWt6x/XeJ6WS+CJfoCImSzHgTSFD4naWmOWgUN
 wOhr+65oozbHqCbc414OP+hw7XvO+9QUjr2zDDf9E37rw2hBaqpeBFSUOhA93Muoi+sV9BnLi
 gibe5LebRhohZbqvJaEsno2YXWE0TSp7Tc/ZUHTFRQlo1Ezh3rNgzSHo6lNUdEYyZK/xl0PMV
 uHbMgfcSM7uWGthYMbZ1iGkNTgDmfOPqsdVXK5BSBq4nKM2lDhSw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MgiXQ-1pmTXC2xJc-00hR6v; Sun, 09
 Jul 2023 17:43:14 +0200
Message-ID: <380911b1-13b0-2c69-7adf-f40abb604c6c@web.de>
Date: Sun, 9 Jul 2023 17:43:10 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Dong Zhihong <donmor3000@hotmail.com>, loongarch@lists.linux.dev,
 kernel-janitors@vger.kernel.org, Wang Xuerui <kernel@xen0n.name>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Youling Tang <tangyouling@loongson.cn>
References: <MEYP282MB2597CD6E861D659E3218148DD933A@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] loongarch: Make CONFIG_CMDLINE work with
 CONFIG_CMDLINE_EXTEND and CONFIG_CMDLINE_BOOTLOADER
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <MEYP282MB2597CD6E861D659E3218148DD933A@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v6u/cBSbBZdAgEFSRtaQRO3+QNJIZPgYJKwY7bFFOUMt6sHWzBJ
 B0TaeS9l3u42XVZ1VhmG6TE0OINEM/U045id2EyvmFeUYX2ktg8YLqnHeNiWQjv40fVWR05
 jbctm4Qn/T5T2MRgvkC3VRSNKO616jeSiuSOOdNA8R0Ra4nJzoDyu30yvqIublqp3ygn2Vv
 1X//42TllGGwkzg8Si8oA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IlqsnQcHvzI=;BaCRrtChnxgcqut0T83meeRvLDt
 DgEt8KBNYO860IutD0t4GteDyxh6X7+PgHr+Z7abOgApWbUyrIzxSe/Np92TAG9IcH8TLGYTR
 WpD+UN/AHfhHzMNEQrRTlf/W3N+d1OWOvj2tgGby6aL30jUKxIxPuVi/09DXYsQBKhEVmhUP7
 jenkvZxZsSVSvpamV/Nz4VVJLpUqvYhMOTRg4aabbrmb0nUfJZQZ5v6DLV7LnUsPZt9f4hUNz
 Xydbi6zeAAbMBF/C+2qmqGdwpZJLjrbT4QzWOROTZqvKYj4NppNpc0NywseVq8urkLkzAp74X
 WdpRejWoQL1tSUrSI0RezN8bZdGbmNbG6vScmEVoWx8lTqolEeW8ZFfvkzdzIEhp1rMcARyJm
 SMo50MJXKafzbXZJjKcZA9kxO/6Run9gbxi1hZniuI0NeQRkoOZjI998qwrEqcuGnG77V5ELW
 89njsGvrR6HStCoX9tGtz823oGRouyoLo9XDrjvMqNCs8fvRLDxAJulTP719g5xlIMUMwdcRb
 CYUCzkHLFAfA4Jc5wfI8p5dhpOSutSJyFSnpfZ7CRmJ5psZW/n8kDU/YxP4B3omoixu1VVYBN
 pP+QdoJELjIIDGKl3/yyZgLrjajRyHsHZaKJABOYolJMY83OiWoeE960hNt9RVR/1cuR9l8Vz
 SXzHOW6ZkSizVZL7KqwLX6khAiwQ6PuV4VjmTmSx0OYFD9Ath+Y5CPhMaMcRRQp6jlYd+FmDC
 utaBFewRG6lkrmkVdHb9wOaeJ7mLfktq3n7iIX1LNJx+uEhW++cXMfTmbjJfOHtPNZFnl+f8h
 ss+6ENjNORa06TxXZ9uyNshpy55sFYsyz+zo4b2gtckIyPtA0VzoKNkWeujLX7NyAQwbZAC/V
 39FUTdFZDJaff9cxIbcjkXjNHyWIQyIbHVyGkFygTKXjQKGcikIb/5nzPI1fc6nN6jb8cV/86
 oaB4JCB9rHVEELsBOte4a43BEv0=

> This patch tends to fix broken CONFIG_CMDLINE, which is not working with
> CONFIG_CMDLINE_EXTEND or CONFIG_CMDLINE_BOOTLOADER. Some code is absent =
in
> arch/loongarch/kernel/setup.c, which should handle built-in command line=
s
> in CONFIG_CMDLINE. The absence of such code causes CONFIG_CMDLINE not
> working if CONFIG_CMDLINE_EXTEND or CONFIG_CMDLINE_BOOTLOADER is set to =
Y.
=E2=80=A6

Which circumstances did hinder you to choose another imperative change sug=
gestion?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.4#n94

Regards,
Markus
