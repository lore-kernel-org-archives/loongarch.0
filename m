Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E87038C
	for <loongarch@lists.linux.dev>; Fri, 12 Aug 2022 16:47:13 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id gk3so2960084ejb.8
        for <loongarch@lists.linux.dev>; Fri, 12 Aug 2022 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ap+EfATfK5WAW7Nse79FXsKVqCdZ3dDAXwUOG0IRWgY=;
        b=QR+QwqGBiZe/rTalQNpA9DsMtxdJgRSGXPmc3P5JlvbJjCoCerr9IoTi94AUhmh0VX
         eEd7rXKtW+6TlUkIQ04p4TEe6Y4k5kWHRlxECaGz12aEqwQuzYPyP4cgI4HwfxYLkyi6
         NICesPDGUVTv+5/xM1Ezsu+UdK73Hyjvr4RhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ap+EfATfK5WAW7Nse79FXsKVqCdZ3dDAXwUOG0IRWgY=;
        b=iWHQpNI+W6QM24gsG6Iqi7XHIJXCxEasNhV0B5diKC87xxcjnJ16Owkwz9ZlNoBSAz
         VQoM3ryuEzL4olq/tDXnpIyoihmejcy3fl9yE0XG8eTtfDXQhptH+NzAmIOplC+S9gz9
         moG6/yynFYelaGbjSsCXuUPXrd/qscurDRqLMTHLKFIU0+adEqlnbaBR2/DSxk6TskU5
         nOXH+DKqC73WuLMjg7h7/9ncGAAMm9kiMDaEpLzdk/VDqFS9QCrQtTN787QomBWUl30d
         zpIS65KQXkUAcRMwI9MUMOu6wf+UYKNshQ52XZtLCE9ptaUhLZpWUN9mHmYH8DkppuCb
         dn8w==
X-Gm-Message-State: ACgBeo1KoUb3EpSbgDjEQH6xNbrAJZF0Y3vS+Hx1aG5xZkZZGZsDwazf
	QcPaCb2vU5JgDkDVIixEXsgya/Tnx68pzq2J
X-Google-Smtp-Source: AA6agR6kQ8fgt0g/8a5YYLwyfzjNrdGVMNXGnROMDrGFvQOz+wRU0qUX6D2TKoKd4yFYw0AdB3EMDw==
X-Received: by 2002:a17:907:3f1a:b0:732:f74d:967f with SMTP id hq26-20020a1709073f1a00b00732f74d967fmr3210813ejc.2.1660322831166;
        Fri, 12 Aug 2022 09:47:11 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id v17-20020a17090690d100b0072aac7446easm968187ejw.47.2022.08.12.09.47.10
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 09:47:10 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id q30so1764674wra.11
        for <loongarch@lists.linux.dev>; Fri, 12 Aug 2022 09:47:10 -0700 (PDT)
X-Received: by 2002:a5d:6248:0:b0:222:cd3b:94c8 with SMTP id
 m8-20020a5d6248000000b00222cd3b94c8mr2694621wrv.97.1660322830060; Fri, 12 Aug
 2022 09:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220812072403.3075518-1-chenhuacai@loongson.cn>
In-Reply-To: <20220812072403.3075518-1-chenhuacai@loongson.cn>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 12 Aug 2022 09:46:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgopYkkZxSTCZGP783868VjoyGALMRst_nceA3aH-TW6Q@mail.gmail.com>
Message-ID: <CAHk-=wgopYkkZxSTCZGP783868VjoyGALMRst_nceA3aH-TW6Q@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch changes for v5.20
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 12, 2022 at 12:24 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> Note: There is a conflict in arch/loongarch/include/asm/irq.h but can
> be fixed simply (just remove both lines from the irqchip tree and the
> loongarch tree).

Hmm. I don't see any conflict, so I assume there is something else in
linux-next that I haven't yet gotten.

             Linus
