Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E87217EE
	for <loongarch@lists.linux.dev>; Mon, 17 Jul 2023 02:57:20 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b7430bda8bso63773011fa.0
        for <loongarch@lists.linux.dev>; Sun, 16 Jul 2023 19:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689562638; x=1692154638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qw8+GHVSbi9gLX1cn6tcsvnRawby8bgkKMYKtc1Otzs=;
        b=DYCTFUR7oCkYqyUAtv7I+k5dgtKp8coaF8yfKCv3sgLopBisQF5GmuC1vXUl0RXLTk
         5NlqmYOgW3hkirsAV6mfby/Z5IzxNW/MnvubIbf+2NQt8yjkqKL7gmafk7I8EskZkZP3
         vZQEztauQhWJkCJ8q6jQNL6iU5wnflbVsf2XvKh5vSUh1FpiZipO0a+ZTVHbr6/0RTi9
         +1fQOtcgYcFI5pE+fgMctt6cB2r159beCJfTyzYqaezD71l1G8Hl2k7BOI7VXcdReUUD
         niiYyYhP9ulnVS4GxKG0Q+nMHa/j6KdtG0O9UAUhBMqwWwZsPJ+yJPRj6tMhpEvZlRbi
         lsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689562638; x=1692154638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qw8+GHVSbi9gLX1cn6tcsvnRawby8bgkKMYKtc1Otzs=;
        b=AzHcXOHc9leIj4pqxvD8eHEbiihq78ZxmyNp5Kl99G7EZZSrTfur7noMmR3R/tE51Z
         fID+lGKhgbOvFussgSD/30B84M/Nor7CDfwd0DKtNFNWMl7ZtDD9TG78lVYzgpX4Y/8M
         MBTjdinUJWo7WqB161uS92o02e/dX4Q5c8/jdSSis8J5BUwac2n0IzG6C5g4rNqeP1ei
         zQpPjsge/CQdgNe03DQnCjXfRNeSCyPu0Eb22NoGFbRYBhZmjSokKRhgMiKOuoZG7c2V
         jOIb/HYh60scxEYkVwBBPKG14ZHbuUInDxYZVGSBx8Fp8Pq5Q3ZGpJj7zgUmRmUwZBtD
         hDGw==
X-Gm-Message-State: ABy/qLak/JfgEjjWirp2jqK+CNRFV6smjT0EJjEBK0bZicxDtWmSueaM
	0Eha0m6tungfVimHwcrcx9a07TgMVBpM0q1NVyA=
X-Google-Smtp-Source: APBJJlEpgyErG5ziV138PL+k/YxbGs9oWFuOpX3yEEDsEp9C9cLg4pRYBvMpJrWe2NUvOB22bGg3IG0Xmz8jcObH7vE=
X-Received: by 2002:a2e:9059:0:b0:2b6:9ed0:46f4 with SMTP id
 n25-20020a2e9059000000b002b69ed046f4mr10393631ljg.23.1689562638285; Sun, 16
 Jul 2023 19:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1689215889.git.chenfeiyang@loongson.cn> <2e10d9d1-e963-41fe-b55b-8c19c9c88bd5@lunn.ch>
 <CACWXhKkUJCFV8DKeAOGPQCfkn8mBhZvBJBMM8SYVgVKY8JEyRw@mail.gmail.com>
 <ZLEJq1G5+7I+FsPo@shell.armlinux.org.uk> <bf0299ea-93d2-43e0-be9f-2d8786678b9a@lunn.ch>
In-Reply-To: <bf0299ea-93d2-43e0-be9f-2d8786678b9a@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Mon, 17 Jul 2023 10:57:06 +0800
Message-ID: <CACWXhKng+LRPY4rjgrATtt9K4hx1bBt8CEMSyg0b5cpzFA0kyw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] net: phy/stmmac: Add Loongson platform support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	dongbiao@loongson.cn, loongson-kernel@lists.loongnix.cn, 
	netdev@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi, Russell, Andrew,

Thank you for your insights on RFC patches. I'll remove the
RFC in the next version of the patch series.

Thanks,
Feiyang
