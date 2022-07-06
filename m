Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1964A5387
	for <loongarch@lists.linux.dev>; Wed,  6 Jul 2022 20:50:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id A1EB8320098D;
	Wed,  6 Jul 2022 16:50:06 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute4.internal (MEProxy); Wed, 06 Jul 2022 16:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1657140606; x=
	1657227006; bh=JWPNKX/+pD9teKBNPYO1ogTvnIYrOYoB5uZTtDcno+w=; b=g
	TE30MsPFqwzhMvCPXnTClEyzGXA9D736g0XkXWI5Q/SOClMttShto/W4QETzqE+r
	2pdbzMeXNNlYZtzg60gMNU28fffmiXNYEI7ll9hfRLovzxRYXMPTjA32x0hrdG7O
	1VB9b2dwozSKeyCO46cAe+4TfzMn3gaoTcSaE0L5MAeiejfx/YWUOU27uBe63yAW
	9QZU7TMD5kljikCQ/+OTG7BVvZfJW4W1As1EsrXLJyW6gqf3RojMRXKuWxIaOa7q
	Q43opW3cxlLPZuBzDtWM4Qx4ocoF2vnQaXLhYeQ7uqZw2IuhNrOOnb77qj7FsvnV
	zqC9Z+dYHRd19DZWH9lPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657140606; x=
	1657227006; bh=JWPNKX/+pD9teKBNPYO1ogTvnIYrOYoB5uZTtDcno+w=; b=r
	tzbgRpQ0jMJzMZYVJx+UElhZxURVEJuN4jl6HAfTUsjppvmEe5+6v3o/OW/Z3Cwj
	2En+RT2iPFZPOoDc17EeMEIy617wwsiS8I+3uXT+qMSmpLvW89TJ9Me/EHg7YTye
	YqnLmvfv3b6Jyl/RIhw8swXJrnQcBejDLJrKdtpoxk7D3CMIEU5VBLyoE0KiawL3
	2W6pn70fY0qccak5gzLT7yUsdb/t+SX761aH7ScQNIga11tn1TBFGhRupgJxfrU5
	iCzH5tkvEkqrZ0UT/GXamBzrMdGl8BQ1ZtoFARoQz8Fxphgpv3A/yP9K/xfpa99I
	1zLX1QOTURYZsy6OTdghw==
X-ME-Sender: <xms:ffXFYsYuzcVr81WI2XnxCLjH6Nkm4odiMh57yYYzVP9tvPuIX7aIkw>
    <xme:ffXFYnbq4KqAVq5ERJ8WGfBJGYRvXLvk2ioyOLorEkRQ3ZHz9dsqVdQ02iXH2Dczk
    MG9nkz26o5wBcxoWIo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedgudehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefh
    jeeugeevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:ffXFYm8wkkT6IFd0ehmRqt2ybjfcF_lcUH3J6yQw71c-7GxS9mc-Yg>
    <xmx:ffXFYmrF-bbl9lmFDP5Ezif0Ms-MOHOYzYHykvYPJRjxoB8bJ531JA>
    <xmx:ffXFYnoOsnUJ25leddjdhcbEyN1RCTjbQg9pZPvD7PZ3GQNp1r23-g>
    <xmx:fvXFYmVMwYN06ME0fxQmlLqrPBzyTo0C2aupo0c2FmSwHDXNNvRalQ>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DCC8336A0071; Wed,  6 Jul 2022 16:50:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-719-gc39a70fa89-fm-20220629.002-gc39a70fa
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <9d064771-9402-4e84-96f8-4713cddf42f2@www.fastmail.com>
In-Reply-To: <c824b9ca-c9c4-1912-7845-99a0989277a4@loongson.cn>
References: <20220704153612.314112-1-huqi@loongson.cn>
 <4273e104-8392-6a06-5d18-a1933978d8c3@xen0n.name>
 <22a1ba993e298ce12a374decefebeca484240883.camel@xry111.site>
 <16c9ccaa5e5a2ffd39272cff6f66e487c659b571.camel@xry111.site>
 <CAAhV-H5+qd1ZrOqE8fgRmWshXy57AfEFpyKSK8ZstZZEQ53owQ@mail.gmail.com>
 <ac46f5cb4c8d1154cfc3e862fb5211e869839c9a.camel@xry111.site>
 <c824b9ca-c9c4-1912-7845-99a0989277a4@loongson.cn>
Date: Wed, 06 Jul 2022 21:49:43 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Qi Hu" <huqi@loongson.cn>, "Xi Ruoyao" <xry111@xry111.site>,
 "Huacai Chen" <chenhuacai@kernel.org>
Cc: "Xuerui Wang" <kernel@xen0n.name>, loongarch@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] LoongArch: Clean useless vcsr in loongarch_fpu.
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82022=E5=B9=B47=E6=9C=886=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8A=E5=
=8D=885:00=EF=BC=8CQi Hu=E5=86=99=E9=81=93=EF=BC=9A
> On 2022/7/6 10:51, Xi Ruoyao wrote:
>> On Wed, 2022-07-06 at 10:35 +0800, Huacai Chen wrote:
>>
>>> Maybe Xuerui and Ruoyao have some misunderstanding. LSX/LASX will
>>> surely be upstream, this has nothing to do with cleanup VCSR16.
>>> Because FP/LSX/LASX share the same control bits in FCSR now.
>> My guess:
>>
>> Almost all behavior of vector unit is controlled by FCSR (for example,
>> the rounding of both FPU and vector unit should be controlled by FCSR
>> altogether), except one bit similar to the bit 24 of MSACSR ("flush to
>> zero") is in VCSR [^1].  And "flush to zero" is not really useful so =
it
>> will be removed in 3A6000, and we'll not use it for 3A5000.
> Actually, flush to zero has been removed in 3A5000.
>>
>> [^1]: A more bold guess: the hardware engineers could have just said
>> "let's wire this register called MSACSR in GS464V as FCSR16/VCSR in
>> LA464, maybe it will be useful and who knows?"  But now in practice i=
t's
>> not useful.
>>
>> Am I correct?
> The hardware(LA464) has removed the vcsr("has but not use" is=20
> incorrect), and here are some details:
>
> - For all FP operations, including LSX/LASX, they are controlled by=20
> fcsr0/1/2/3.
>
> - For LSX/LASX other operations, they are *not* controlled by any othe=
r=20
> CSR now. And fcsr16 to fcsr31 are reserved to control these operations=20
> (now they are *undefined*).
Sorry but what do you meant by =E2=80=9Cthese=E2=80=9D here?
If it means LSX/LASX, are you trying to say that future chip=E2=80=99s L=
SX/LASX won=E2=80=99t be
compatible with present 3A5000? As your said fcsr16 and fcsr31 are undef=
ined
for now.

Thanks
-

>
> - Flush to zero(MSACSR.FS) is removed and not supported.
>
> - If you use "movfcsr2gr" to read the fcsr16, the value is *UNDEFINED*.

--=20
- Jiaxun
