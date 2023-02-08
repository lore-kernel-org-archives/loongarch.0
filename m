Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DCE9449
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 08:06:46 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 6A4903200564;
	Wed,  8 Feb 2023 03:06:45 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 08 Feb 2023 03:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1675843605; x=1675930005; bh=5yKWBSh3Gk
	Z49uSSSGKd13vlZdjjf2xcz3rZbXFJUj8=; b=MLxSEVnKTtpNhJy4s4Z6SwWrLd
	M2GPzQY2cs32HhsL1CI+Rn5MJ06oRCFyhJCyNSMCAlSQE+tBlVnHEhZFv9ka0Ra2
	Cb8h+DBPRJ2jEv/s/OIt4cc0qBnw5RxgssRmX8Xr7Aa3MfbP5UWTShzt5yDdVyGk
	nV3J6/5G+s9mwZM4CMNychTKVRL/6DOT4u0ar4RAEgKadOjsmQSQTgb1InzxTGcn
	rt2MbIKglx8mGOR68IwVDo7cizMjN1kfTvqJYmKRL7uGAwruWYQbDFYk4EKShZ3+
	iDQ/DbPZEnXWiPSkhNss+0rWcGoJ37AZ4xVNAaszz2FkjrF5p7vyiwUnsvzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1675843605; x=1675930005; bh=5yKWBSh3GkZ49uSSSGKd13vlZdjj
	f2xcz3rZbXFJUj8=; b=srC9EyasVIJ7OP17Anr255vbCOCPRXgQWeMzUk8cQZTe
	dOT6bMhjai9QQh+CTNNSy6wonmO8Ev/2FOSe1vHGtIsOpAp/TVmL0xFBhIXR73UC
	xid35edw4yQsWGvcCJB73qc+ZW8ZHK8/W2u1NjBuMW2g+NhjhEJJNSnIBxpqe7yn
	saO6Y5pj0Rv9XTOmllbbpazat+MVgC1sYRUKCZRD5QWOxxTLkljjSvVzkwEBSXMr
	vlTZv0hXW0Z+lY+g7pVEB28E8z1HwIhtneYqfOqS14QG4xC78fQpKCphmckpS7zk
	QHOCQ2k8OIHEJXhR+N86gxsTff0Fiq++EjH+DxLaTg==
X-ME-Sender: <xms:FFjjY8OXXGtsQlPP6VcBedQNALDfNLII1rOkydz8_ynK6NElYI9OHw>
    <xme:FFjjYy_sfzAJOekqNoCJG3jrE2RI_1tsxqYMCcDwKK_VamigC8eH3rDnhDlZRcKXd
    CnP5CIOtr_nNt03rqk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegledguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:FFjjYzQiXgkcywEFr_oGyEJImrPkHtkR1mUG7mEwrOjA8MViVVGYcQ>
    <xmx:FFjjY0u0onS3WGMtCch8uPmZgWKmzhwQMflXhjcp4AV8ilOv9oqowg>
    <xmx:FFjjY0fqqVJQ4kIlkYnzu-ukb1J_3vTcEE_jq29pA6zptZo-1FeChg>
    <xmx:FVjjY5HjoFfswnTnnsrYAcnbRmt5HLUV1eDkz7CW1TdJwGoTOIh_gQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 80D4FB60086; Wed,  8 Feb 2023 03:06:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <7c98aac5-6b64-4f6b-b242-7ad3b8a334a8@app.fastmail.com>
In-Reply-To: 
 <CACWXhKn1N6f7XvtrbDno4UyAhMZbV_htQoRbm0ws9gjF08wnBw@mail.gmail.com>
References: <cover.1675734681.git.chenfeiyang@loongson.cn>
 <1af05c1441e9f96870be1cc20b1162e3f5043b2e.1675734681.git.chenfeiyang@loongson.cn>
 <1e7da4e7-392d-4a9e-aa95-0599a0c84419@app.fastmail.com>
 <CACWXhK==yVZGZbY+3DUAuxL34=gKwQv20Cw3y1+QKir0D2F3EQ@mail.gmail.com>
 <Y+MXk9A+gB1W6T/n@1wt.eu>
 <CACWXhKn1N6f7XvtrbDno4UyAhMZbV_htQoRbm0ws9gjF08wnBw@mail.gmail.com>
Date: Wed, 08 Feb 2023 09:06:24 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "chris.chenfeiyang" <chris.chenfeiyang@gmail.com>,
 "Willy Tarreau" <w@1wt.eu>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 "Feiyang Chen" <chenfeiyang@loongson.cn>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] nolibc: Add statx() support to implement sys_stat()
Content-Type: text/plain

On Wed, Feb 8, 2023, at 08:42, Feiyang Chen wrote:
> On Wed, 8 Feb 2023 at 11:31, Willy Tarreau <w@1wt.eu> wrote:
>>
>> I generally agree with the Arnd's points overall and I'm fine with the
>> rest of your series. On this specific point, I'm fine with your proposal,
>> let's just start with sys_statx() only on this arch, please add a comment
>> about this possibility in the commit message that brings statx(),
>> indicating that other archs are likely to benefit from it as well, and
>> let's see after this if we can migrate all archs to statx.
>>
>
> We have a problem if we just start with sys_statx() only on this arch.
> When struct stat is not defined, what should we do with stat() in the
> nolibc selftest?

To clarify: your proposed implementation of the stat() function that
fills the nolibc 'struct stat' based on information from 'struct statx'
is fine here. Just remove the 'struct sys_stat_struct' definition
loongarch but keep 'struct stat'.

     Arnd
