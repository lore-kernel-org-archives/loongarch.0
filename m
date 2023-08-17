Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B890312B9E
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 11:37:55 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-40fe9c38800so46342881cf.0
        for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 04:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692272274; x=1692877074;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w31IQ5YkuY2ltFjG4ujyeSdaSaelLhYfdYtgX94Kf4E=;
        b=EHVGSdB8PoUrtTCoQFXL+MK+2xc+VAtPK4qKUYQwyzjM5DBPYrCKcPmzfgsVCpr4Cw
         Ebfe/1EtiuLdE0T/m99L0FuBCVRELNfBzDg+8n9tvhQCFZcqXLXhLlRZADiUn2n7I9wi
         WcyDAEnxKkc9AZGWAbHlBZhXrJlees9LEUFrOcTDcnWMHX8haQk3ATXoTp1E8lyFoyUd
         qwCEQreDh3Zyda1l8U2rFHCgUKoqVICpGSmUM+324uwRYvlnh+aZh8YKDdQb44WVTcle
         DDjNZQUIPKuVWpEK1CsvwtxQnouYWI485BC9zeteA/+abMq9yb1K/HOKACy1ztRQVn/+
         ilSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692272274; x=1692877074;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w31IQ5YkuY2ltFjG4ujyeSdaSaelLhYfdYtgX94Kf4E=;
        b=b7TK6+cXQ3c6N+aPXdZ3wCQ+xyPXiIM+Jn7YvpFSeLPJ6hB3eE4z4vcGqi+uZDlOh4
         hFbMDc07F2Akh6uwxQjmUe5XwfTW71hvwSc5oqedD6wSM8sVj+jeNWA/kMPgwz8FBhMU
         rpFYuygzocss5+5F2Fs32NlheamyWCdsuOcNyzvhOuxL3W7h9uN6CjADP358KtQnxIPn
         hOTEg8X3/hMxkIFOQT61zZ39PmCjcK+q2dj4DuU8ruBZp+hTlq4zbLMuHudMpzzsmGf9
         rNwwRn1QG43Eo198w5Djo7DzOMBnjclcxUBCtUEl+DyS1697gRmOFHCOI9JDfm9XpqSt
         AzEw==
X-Gm-Message-State: AOJu0Yx2pGzGrk5OR08T2Rw4TDeYr8Uqkg4NDlhQVY0Kem3DYVE78r+7
	JlUHgjz49udW8+K5aoeDacY=
X-Google-Smtp-Source: AGHT+IFI3+CHPpKULX2tpEaGS8l+bPl1rOS8rSkMfyrr656mErrSbDd1H1POnL349Ph/iwf4YakojA==
X-Received: by 2002:a05:622a:182:b0:40e:6f1:3d38 with SMTP id s2-20020a05622a018200b0040e06f13d38mr6443538qtw.8.1692272274313;
        Thu, 17 Aug 2023 04:37:54 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ay24-20020a05622a229800b00403cc36f318sm5161369qtb.6.2023.08.17.04.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 04:37:53 -0700 (PDT)
Date: Thu, 17 Aug 2023 07:37:51 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 3/4] arch/mips/configs/*_defconfig cleanup
Message-ID: <20230817113751.GA25020@localhost>
References: <20230817025942.3209-1-twoerner@gmail.com>
 <20230817025942.3209-4-twoerner@gmail.com>
 <f7230276-decf-2248-52b2-c2de4a13647c@linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7230276-decf-2248-52b2-c2de4a13647c@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu 2023-08-17 @ 09:33:13 AM, Philippe Mathieu-Daudé wrote:
> Hi Trevor,
> 
> On 17/8/23 04:59, Trevor Woerner wrote:
> > Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining mips defconfigs as it
> > was removed in commit 57f8e00d8a82 ("usb: 71 musb: Drop old unused am35x
> > glue layer").
> 
> How 57f8e00d8a82 is related? Do you mean commit 9db5d918e2c0
> ("netfilter: ip_tables: remove clusterip target")?

Yes thank you. I'll send a v3.

> 
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >   arch/mips/configs/ip22_defconfig        | 1 -
> >   arch/mips/configs/malta_defconfig       | 1 -
> >   arch/mips/configs/malta_kvm_defconfig   | 1 -
> >   arch/mips/configs/maltaup_xpa_defconfig | 1 -
> >   arch/mips/configs/rm200_defconfig       | 1 -
> >   5 files changed, 5 deletions(-)
> > 
> > diff --git a/arch/mips/configs/ip22_defconfig b/arch/mips/configs/ip22_defconfig
> > index 44821f497261..dc49b09d492b 100644
> > --- a/arch/mips/configs/ip22_defconfig
> > +++ b/arch/mips/configs/ip22_defconfig
> > @@ -127,7 +127,6 @@ CONFIG_IP_NF_MATCH_TTL=m
> >   CONFIG_IP_NF_FILTER=m
> >   CONFIG_IP_NF_TARGET_REJECT=m
> >   CONFIG_IP_NF_MANGLE=m
> > -CONFIG_IP_NF_TARGET_CLUSTERIP=m
> >   CONFIG_IP_NF_TARGET_ECN=m
> >   CONFIG_IP_NF_TARGET_TTL=m
> >   CONFIG_IP_NF_RAW=m
> 
