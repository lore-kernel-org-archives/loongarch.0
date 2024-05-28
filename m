Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043AB178CC5
	for <loongarch@lists.linux.dev>; Tue, 28 May 2024 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716925828; cv=none; b=SpsurDewTgQzRJn37ngcajDt61CyrN+OqJaLAtujCK51VBQAgWTKOuCTZ5oRwe/KFBzktaq4OkusBrpe6mmZCkvEpo1Pj4ujaNxR8Z2u0bwBter210j02ul26iJKrPj1+7voB/ut7hJsp49D0G/B9760XE+f8x9PtJ4JAQtlT5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716925828; c=relaxed/simple;
	bh=tzPr8Eb09GFk0ZuPoJgIJk0k4J+0i2WeMWKnh37deOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvXdYNvd0u8UrKjxbOpzT7CT55R5Hb1tpDnJPgU0nNyZP3hah76bINAchUgzamaPinCRkUB4+ScUwFOYJ++nkGzjvWhIHxm9Kuf5G16N8RoruVYqGhxiOfUYtiN0bUY89Utuvq6Jj7Si1RysI1KkCHj1coyTGXma3WM5h/euY20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhrJ6Yuv; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhrJ6Yuv"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f082d92864so9408605ad.1
        for <loongarch@lists.linux.dev>; Tue, 28 May 2024 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716925826; x=1717530626; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyW9e/v1pIEwAb5TemR0VWnnWzP07vqRLcWckuomv4o=;
        b=PhrJ6Yuv7BxTktDwITHpMd0pYTBax+Clz5Bo4bweGEyC3b/W7HoQsUTSLnJ/18mpEH
         8niSo9hO2x3t6RkjcPKwHgTn/KfMMk4JfcT3wr1ENn77n4pSgx539IGMTGrTyiPgMlre
         CjEHCHbMjfc5eGpwB+RZ1ZnS37hxUTDnANc/m0uiuM3mAfZQShm6N6+84qB/k4r6CpNp
         2Z5T/guPlrCIfrhHa9cIeziXJ/zWpwcyxHHBIRi5UK64xudC+HHAg1lSjj1fQl8IICRS
         jIWE6+e4V8Iza3G6THFhFwHEg9UI7iW15bEmfVK6/JBfEAetDv4nAnma2MuR9I4xEiVo
         iGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716925826; x=1717530626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyW9e/v1pIEwAb5TemR0VWnnWzP07vqRLcWckuomv4o=;
        b=CXNo0dh77D9HwbbcvUAT2RPpv2kqLYINZfm2FAK+TMGr6QbwEj6SiucO3FJfSARSgx
         nwWwSQSijTvSGzAiDkhg6rRIUHysfCzOV702MY+6yDnz0EA4FAlCZNK0HcA/1dwHhYJU
         JR6RFQ7dhBEY3hT8VM0ivUsLxEFeqbOLKSYWEOR0XdYS4EldO0GQellxXZnlDkiYm6/U
         3gcAl4dfmPZuNeXigSxnoeDcqqmh6duKDDJmsm3UKik2mA9RQXsABHErssZQi2trrK9l
         DPcaQNx8iFmBGVVCCuKCkgvnztA6G3JFykrTiU6I13kqotbIJPIs8dhhbyF2k8GUv+74
         CPzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU20QQlAi7WXeC2irXILczMg9nhMRQhv881dyMsFXbrRZnaYHF1ESg3kxD/xJWEX86ws1W7ypAUfV0tTGrk/a8GXygiZdU55h4C
X-Gm-Message-State: AOJu0YxSwz2UiSPx8+JeVbMoBbjBAqtNIBvY9HDu2ZJpSNjwGAccosdZ
	zNFkXEouIN3RMNUvLQcbuH+m7YvVNDUYHWHm9cLD7+FaimKrKFl/PqaEyQ==
X-Google-Smtp-Source: AGHT+IGw4SdnHhtTCMWG5plm8ThvQxcjGIK2gtMTBqE0gfnAiAicAjMoHbRr+nsl7bXf+IFydB+54w==
X-Received: by 2002:a17:902:6504:b0:1f4:9468:38b0 with SMTP id d9443c01a7336-1f4946839e6mr58247165ad.61.1716925826097;
        Tue, 28 May 2024 12:50:26 -0700 (PDT)
Received: from localhost (dhcp-141-239-159-203.hawaiiantel.net. [141.239.159.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f481d5a77bsm52568295ad.298.2024.05.28.12.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:50:25 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 28 May 2024 09:50:24 -1000
From: Tejun Heo <tj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: cgroups@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [tj-cgroup:for-next] BUILD REGRESSION
 a8d55ff5f3acf52e6380976fb5d0a9172032dcb0
Message-ID: <ZlY1gDDPi_mNrwJ1@slm.duckdns.org>
References: <202405271606.DYMCKs25-lkp@intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405271606.DYMCKs25-lkp@intel.com>

(cc'ing loongarch folks)

On Mon, May 27, 2024 at 04:14:10PM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
> branch HEAD: a8d55ff5f3acf52e6380976fb5d0a9172032dcb0  kernel/cgroup: cleanup cgroup_base_files when fail to add cgroup_psi_files
> 
> Error/Warning reports:
> 
> https://lore.kernel.org/oe-kbuild-all/202405270728.d1SabzhU-lkp@intel.com
> 
> Error/Warning: (recently discovered and may have been fixed)
> 
> kernel/cgroup/pids.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction
> 
> Error/Warning ids grouped by kconfigs:
> 
> gcc_recent_errors
> `-- loongarch-defconfig
>     `-- kernel-cgroup-pids.o:warning:objtool:__jump_table:special:can-t-find-orig-instruction

I don't know what to make of this build warning. I can't reproduce the
problem on x86 and the referenced commit doesn't have anything special. It
*looks* like it could be something specific to loongarch. Can you guys
please take a look?

Thanks.

-- 
tejun
