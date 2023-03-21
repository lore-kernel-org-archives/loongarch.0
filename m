Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662A19470
	for <loongarch@lists.linux.dev>; Tue, 21 Mar 2023 14:25:50 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id t129so6978224iof.12
        for <loongarch@lists.linux.dev>; Tue, 21 Mar 2023 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679408749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j92IPH/tXuCtZZM04rrZEMBKuL+XNp59wtlpqWm2eMc=;
        b=XYixwF/zo2JNDZ3vDZSrH7WX9PMUCvPLbXOVgWfdDNhGauVScBWFc0kotbee2pJwa8
         LOR0er0Wzs6qwjrdK31H9MqfMcQDszYtR8h7+JMX5SlIiAk5AtduCaQ0zMHP+hDv++T7
         MRljgjdbr+PxcqXNIuG44VrJ/roOhhuZ5oD92nftUt2Fvh6KJSS7A0hqqOqkOBRpP0c4
         rLBh6AAIn7yci+dUnVWVxe19SSbQM3jMwy223Pi8R157yuRXOBo1NrY1l919tbQoSRpp
         1EloxOxXGz5qRWVkUa8g6GCYmcaTzq+Hs24iB5ItasvC8EeLvysD7BYkUlcvnK6aoKdY
         9+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j92IPH/tXuCtZZM04rrZEMBKuL+XNp59wtlpqWm2eMc=;
        b=Ep4BK/by4qLFZNKVG0n18M3/flveHL1nDPAGdxprzjeyIfYm06+bHUP9HpaZGOdvb+
         3RZvbWF1tdZfYx1Xq+SlIvk7sH8603Q88MxcECmone/rKsiR69l6i7mIWKhVMO+z0Ofk
         ocemORLaA7j3eil9VCQ8Jkx4cFXYE5OHqpiyo+cDTozvtjkS2l5aBbszhQWQWx+p+jz0
         VPKRpmR+tFlfPK6wkSKI9AIe+sZlr8XWeExHEUrVedLUj6AQw0I1FYwt/9Zz2bXxsN2R
         /lzkY7qY44F8GBTY2PyMnlxebRJWEL1X7nTWAAR5stjyf7jSHIntr7WhWSTGV5EyM+83
         qUgA==
X-Gm-Message-State: AO0yUKVVvBgYrZtfgbNNS89i7M2ANYXPJGI4ynl1kYGYbTTX+uiGmfdz
	4DFNfEcugu6WbyEghHQGRXk=
X-Google-Smtp-Source: AK7set+QJ6ZbArvXrJdknp1ypG5wAeyQFaDQF8MEvVTKaXzBbdhdUQ02KeR73lXXATVNLOgfN9J7kg==
X-Received: by 2002:a5d:89d2:0:b0:757:ef37:933c with SMTP id a18-20020a5d89d2000000b00757ef37933cmr1773464iot.16.1679408749217;
        Tue, 21 Mar 2023 07:25:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d1-20020a5d9bc1000000b0074564031d75sm3828187ion.2.2023.03.21.07.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:25:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 21 Mar 2023 07:25:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH] LoongArch: Check unwind_error() in arch_stack_walk()
Message-ID: <f61ac027-0068-40f0-87bd-17f916141884@roeck-us.net>
References: <1679380154-20308-1-git-send-email-yangtiezhu@loongson.cn>
 <253a5dfcb7e41e44d15232e1891e7ea9d39dc953.camel@xry111.site>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <253a5dfcb7e41e44d15232e1891e7ea9d39dc953.camel@xry111.site>

On Tue, Mar 21, 2023 at 08:35:34PM +0800, Xi Ruoyao wrote:
> On Tue, 2023-03-21 at 14:29 +0800, Tiezhu Yang wrote:
> > We can see the following messages with CONFIG_PROVE_LOCKING=y on
> > LoongArch:
> > 
> >   BUG: MAX_STACK_TRACE_ENTRIES too low!
> >   turning off the locking correctness validator.
> > 
> > This is because stack_trace_save() returns a big value after call
> > arch_stack_walk(), here is the call trace:
> > 
> >   save_trace()
> >     stack_trace_save()
> >       arch_stack_walk()
> >         stack_trace_consume_entry()
> > 
> > arch_stack_walk() should return immediately if unwind_next_frame()
> > failed, no need to do the useless loops to increase the value of
> > c->len in stack_trace_consume_entry(), then we can fix the above
> > problem.
> > 
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Link: https://lore.kernel.org/all/8a44ad71-68d2-4926-892f-72bfc7a67e2a@roeck-us.net/
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> 
> The fix makes sense, but I'm asking the same question again (sorry if
> it's noisy): should we Cc stable@vger.kernel.org and/or make a PR for
> 6.3?
> 
> To me a bug fixes should be backported into all stable branches affected
> by the bug, unless there is some serious difficulty.  As 6.3 release
> will work on launched 3A5000 boards out-of-box, people may want to stop
> staying on the leading edge and use a LTS/stable release series. We
> can't just say (or behave like) "we don't backport, please use latest
> mainline" IMO :).

It is a bug fix, isn't it ? It should be backported to v6.1+. Otherwise,
if your policy is to not backport bug fixes, I might as well stop testing
loongarch on all but the most recent kernel branch. Let me know if this is
what you want. If so, I think you should let all other regression testers
know that they should only test loongarch on mainline and possibly on
linux-next.

Thanks,
Guenter
