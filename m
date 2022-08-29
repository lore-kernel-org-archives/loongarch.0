Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A15F7C
	for <loongarch@lists.linux.dev>; Mon, 29 Aug 2022 11:37:22 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id 1527F2B05EEF;
	Mon, 29 Aug 2022 07:37:20 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 29 Aug 2022 07:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1661773040; x=1661773640; bh=OMyRTkiqC7
	19sf4sZbkRI86tZB1Sd8j4wBhlvt4F4SI=; b=djdXAjrf2FDh2lMocp0uzSwn0k
	vv3WIr66kctkK7I7YsnCXg6NOqSPzcesj+fUCR3kqqYLYL/8HSThBQyOCvdc6TX8
	8tfLuqAzcAiSXp6LbcfSAga8AbLg/bemzQHVa4OZj50GmrlYuxY78WfShJhhB6KO
	vOMIkcHLgkye10U16kGHKQz5XlSu1pNyiQaaXfxzlpwpvJQ/SDH0CV9/Bb+PuqF5
	frVdyDON+pNT7ibK1HpQGlogkMeqeDD+ph1k+JYy4u8o/IzVmQ06Gz5GZG/3TV++
	d1uKtQLnMpWgGVusqGpScyRwF/pcHMtTJ+mrNmCHydrlmxVsMZ5UhwDvX8Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	i56a14606.fm1; t=1661773040; x=1661773640; bh=OMyRTkiqC719sf4sZb
	kRI86tZB1Sd8j4wBhlvt4F4SI=; b=MQ5q7kZKw3xR/ZW2MdtR7eRZrpjpkg6c6g
	28o85Nsq9TApie72c9Xg6wIKg7nloQcEZ+flto5/fPgvYxqOYkyaw1yMjVLzIviV
	tpOU1QT4tcRStfoz8nRI+YySPVmdTARUyxioWiV6c7sqcNhUTRxh5xTN1mvRwmGW
	2z3gc7V4nm6X9c4dKynDg9W8g7dHf7gTfsfOz8e6qX2bd/QAXqBrHhjOZZGDdQCa
	Xmj7X3HrWuc53diaNlgVqXQ6PmO6qb1eaKq7T+y0aFeCqLCIWTLX0nlvGFgal1ph
	w1rH7ibX2eyUB7c+sWaC8hTxvg7EkwFQBszW5e5fd/HZhGyo/3Dw==
X-ME-Sender: <xms:76QMY_8UN2lz6HwJX2osTRGAXHDbk5a-zdlpsrjX0f96BYRNlW-PHA>
    <xme:76QMY7smWw76c8GN_2-yCOizQDZV5oUtItIw7Relnw8wMSYSONOwc9PZ2ziXZmMS1
    iuVIIyg7N7WQKHwKF8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:76QMY9DXX9cvJVzlbq0mfgO3T6oE4ZtURNNIG_wrBLI0RDUPO3A3ww>
    <xmx:76QMY7cvV2jvn17Xe8f8PH-SU-HaHgtzOF4onBmDGvwISWN5sROfxg>
    <xmx:76QMY0N_9aycWLGk7WV_lZBCDZxow1cCBSKERH-DT5DLpMETZyXBNg>
    <xmx:8KQMY9YRKoRFNz8MWv5d5vLjqVkKEGRxT4pLEGlBALtESjMHd2h0oSlgHKGmw9l4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 45828B60083; Mon, 29 Aug 2022 07:37:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <d1a52fa2-380a-421b-8c46-5150a39be484@www.fastmail.com>
In-Reply-To: <1661766931-7277-1-git-send-email-yangtiezhu@loongson.cn>
References: <1661766931-7277-1-git-send-email-yangtiezhu@loongson.cn>
Date: Mon, 29 Aug 2022 13:36:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: Fix warning: #warning syscall fstat not implemented
Content-Type: text/plain

On Mon, Aug 29, 2022, at 11:55 AM, Tiezhu Yang wrote:

>   CALL    scripts/checksyscalls.sh
> <stdin>:569:2: warning: #warning syscall fstat not implemented [-Wcpp]

> @@ -1,4 +1,5 @@
> /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#define __ARCH_WANT_NEW_STAT
> #define __ARCH_WANT_SYS_CLONE
> #define __ARCH_WANT_SYS_CLONE3

The correct fix is to change scripts/checksyscalls.sh,
making it always define __IGNORE_fstat

        Arnd
