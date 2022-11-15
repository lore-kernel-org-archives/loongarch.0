Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6421B1841
	for <loongarch@lists.linux.dev>; Tue, 15 Nov 2022 08:48:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 7588532009D1;
	Tue, 15 Nov 2022 03:48:14 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 15 Nov 2022 03:48:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1668502094; x=1668588494; bh=1gBRlp/B3m
	Fmd4P+UsRzxqbQEl/5QP24VsS20bpTqZE=; b=almPYDJ2/HAlrOX+uE3Pzj1rx1
	eZKM0dDZEPbjNI1w+gx3/ilXunpBLH+3whHgGkho1lC7eePjJ1lNu6Mqz/zVDU4C
	LwbIjEPCzZQf86Q0tEF9QoGsfQJRhODlkHLz4SiorxXkUxXFaX8vp77xApXJgL42
	IY16CdG2kDY2EFyp6vgS8FwKHRSUuw6N7D2MFtLHfjK506JHj7mTuA5hAY9jlXTT
	2CE05E6+OL7WDPxtW2YzRjpf/hozueHHYy0YjMKsNYaye2jxWvH6xy33BIIJVAXQ
	/wvcO8fR4PrbqDH4RLAyoQS5e5KIH9J/6P3EwStwhVS/F3mR/tqFurUX+s3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668502094; x=1668588494; bh=1gBRlp/B3mFmd4P+UsRzxqbQEl/5
	QP24VsS20bpTqZE=; b=o1kip9K02beQnshjGok4LzZtaRKZ7I/ZYkDImq88HSBU
	4qz7HXnOnGRVDVCcBWS5ooGIdQhdjLFHK3oQ/iN34a/ZW1g7ZYURGSZbokA8MUN0
	E5gEK/PxbzeXgIUHGOavwQytHfm8hSBTzj8Q7atnJa0ZmiJJuOcxpuj6m/5V0VH4
	Kl5+3fIkMvSetGQJl4iXMrlveAuIh08ySrMFS/E4MfPOLdvpdQNdpKZNmHbaRuFZ
	uWETodRw3B5vwikv511rA9nj845As9jL7CO76iEeHgD/0ZYWPgY3FziH147EsZ13
	ttrT8vbv1GJLQLyjy4qGCJzDtP9wQLQ71IqkGZ7lsA==
X-ME-Sender: <xms:TVJzYyAqZ_41oQA6Y7mgU9T5-Euz7UlunsKaiDj8IzZl9PoG51ik-g>
    <xme:TVJzY8jLO9_Cjftra24Y3vFgD7stybtdMjI-qQ2hUHEEAAKtJdZSDs5Dyzk4MMbou
    -YbcL8SFWcR-EDNJ30>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeefgdduvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:TVJzY1nMSwm2wfR4tjKiaIyW-qoU57k2JQBsRMubgxbwpW0_XdTdsg>
    <xmx:TVJzYwxkzeOGxK9vxH5pZaO2vpBQFRGD4mtsVh3TK4fQroZYq9r15Q>
    <xmx:TVJzY3QlqmWiKCKufu0qfCbD_ompHf3h-abufUpob-2GZDn6eqiZQw>
    <xmx:TlJzYxcNKZqXnXX1bjG4s7-lcQ1o63DjqP-rRwgpe22ySYxdi9Ed2A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CA526B60086; Tue, 15 Nov 2022 03:48:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <2d238a7f-8e1a-4959-a6c5-e58567ace6e3@app.fastmail.com>
In-Reply-To: 
 <CAAhV-H5YnpRu=mcdmHy=x9MstTmfFgHU=WV4ZBd49PBkeeZjAA@mail.gmail.com>
References: <20221115025527.13382-1-zhangqing@loongson.cn>
 <20221115025527.13382-10-zhangqing@loongson.cn>
 <CAAhV-H5YnpRu=mcdmHy=x9MstTmfFgHU=WV4ZBd49PBkeeZjAA@mail.gmail.com>
Date: Tue, 15 Nov 2022 09:47:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Huacai Chen" <chenhuacai@kernel.org>,
 "Qing Zhang" <zhangqing@loongson.cn>
Cc: "Steven Rostedt" <rostedt@goodmis.org>, "Ingo Molnar" <mingo@redhat.com>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 9/9] LoongArch: Enable CONFIG_KALLSYMS_ALL and CONFIG_DEBUG_FS
Content-Type: text/plain

On Tue, Nov 15, 2022, at 09:31, Huacai Chen wrote:
>
> I suggest not enabling debug mechanisms in the default config file,
> distribution configs can make their own decisions.

CONFIG_KALLSYMS_ALL and CONFIG_DEBUG_FS are rather fundamental, and
are enabled in most other architectures as well. I would recommend
everything that is needed to run on the most common hardware
configurations and that is needed for booting into a general-purpose
distribution, but not much beyond that.

Other options like CONFIG_DEBUG_INFO and CONFIG_DEBUG_KERNEL (including
options based on it) are probably better left disabled though, those
are the ones with a significant runtime or buld-time overhead.

      Arnd
