Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B053207
	for <loongarch@lists.linux.dev>; Wed, 12 Oct 2022 18:24:14 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id l5so19957514oif.7
        for <loongarch@lists.linux.dev>; Wed, 12 Oct 2022 11:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uf4Q6mDzkHYolnexbxAtn/OulhdrRZBn/s//1eNnWwg=;
        b=MbeVngOZRHdoMllqTr4IQcXLSoP5HSPH4ieXT+UiAMWOPHKMyuBGVLI4tobfVhYpD1
         I6gOpReKUcBJphu0tM4SusihsfwEb9xO+GAt/f7Ut9XGkjAfcjlG7uKD4P4WTaciyCQZ
         fOpKxBXfiyt1ebHN+vzAtzDc/Szljf1htXxWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uf4Q6mDzkHYolnexbxAtn/OulhdrRZBn/s//1eNnWwg=;
        b=p2vQOEhijKI7F7fgdE8N9deNWWKuGu/JPduF6AumrBMbUhM5M7ja2Y2b4f8vc3zKaL
         /sSa+rOmUVoxxknvEyM+hq/xul8ztQtRBmh1XjiL6XzwJmgvO6e2X8Z1iv/WpK2PXJ88
         E9KKu9aA7KjYfCTkvMrX9AmE3qon/HMBwcICFR0+GcnIpqFHZrsf0HJ7VRhuvT3Nt8hd
         aM558zuPMTOUbnmBp8iTJsNFjZToUEw6AgdA1qpumUYfcoc/ekktEbX/8uD08ZKno7Xt
         A73WA56+FEjwGGY9W25mVOrDVKumSu23+h9ZqGQTUFZ0Vxymhqi9m0XABdD1EYAFlHUn
         9AKA==
X-Gm-Message-State: ACrzQf3T+SSiDy8z5eNpI4y5qI7ZO1Lc/i6HQXen2OXTeyhVr/CjMylk
	QvOS39B7kFCczGBFnrf+CFBF7DLhocnMGg==
X-Google-Smtp-Source: AMsMyM5Q0A1rKfxBWNFZRirT1D7aO85L3wPe5UG4nl7W3+N1wVVECvm36blneQY4Y+Y+lfFIPGnpmw==
X-Received: by 2002:a05:6808:16a0:b0:351:6d9b:dacf with SMTP id bb32-20020a05680816a000b003516d9bdacfmr2690546oib.203.1665599053267;
        Wed, 12 Oct 2022 11:24:13 -0700 (PDT)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com. [209.85.161.49])
        by smtp.gmail.com with ESMTPSA id 105-20020a9d0ef2000000b00661c3846b4csm364089otj.27.2022.10.12.11.24.12
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 11:24:12 -0700 (PDT)
Received: by mail-oo1-f49.google.com with SMTP id c13-20020a4ac30d000000b0047663e3e16bso12681315ooq.6
        for <loongarch@lists.linux.dev>; Wed, 12 Oct 2022 11:24:12 -0700 (PDT)
X-Received: by 2002:a05:6830:4421:b0:661:8fdd:81e9 with SMTP id
 q33-20020a056830442100b006618fdd81e9mr9723555otv.69.1665599051939; Wed, 12
 Oct 2022 11:24:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221012144846.2963749-1-chenhuacai@loongson.cn>
In-Reply-To: <20221012144846.2963749-1-chenhuacai@loongson.cn>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 12 Oct 2022 11:23:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj=62F=soverz1NT41B1_CMtaxnUZX+_qGQ3mbeQdjivg@mail.gmail.com>
Message-ID: <CAHk-=wj=62F=soverz1NT41B1_CMtaxnUZX+_qGQ3mbeQdjivg@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch changes for v6.1
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 12, 2022 at 7:51 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-6.1

Grr.

This was rebased mere hours before the pull request.

Much (all?) of it has been in next - with different commit IDs, of
course, but the question remains why you have rebased it?

It just makes it much less convenient for me to check "was this in
next?" and is generally a *horrible* thing to do.

                       Linus
